# PRP Fork 代码评审（2026-09-22）

> **状态更新（2026-09-22 晚）**：P0-1/3/4/5 与 P1-6/7/8/10 已修复，P0-2 以最小方案落地（EventChannel 单向推送热点停止/USB 拔出事件）。修复后本机（Flutter 3.41.9 = CI 同版本）`flutter analyze` 0 问题、`flutter test` 121/121 通过、dart format 干净。P2 项未动，见文末。
> **实施备注**：EventChannel 监听采用懒订阅 + `channelBindingAvailable` 探测（`ServicesBinding.instance` 同步 try/catch）——无 binding 的纯单测环境不订阅，避免 EventChannel onCancel 的未处理异步错误把测试打红；直接在 cancel 外包 try/catch 不够，错误会走 zone 上报路径绕过 await 链。

评审范围：PRP 全部自有代码（约 2250 行）——`prp_provider.dart` · `transport_manager.dart` · `transport_interface.dart` · `wifi_hotspot_transport.dart` · `usb_tethering_transport.dart` · `HotspotRelayPlugin.kt` · `UsbTetheringPlugin.kt` · `hotspot_relay_page.dart` · `MainActivity.kt`。

**总体判断**：骨架是好的（接口抽象、状态机设计、条件导入、测试意识都在线），但 PRP 目前是**半接线**状态：UI→原生这条链路通了，原生→Dart 的事件回传断了，且 PRP 层没有接入 LocalSend 核心收发流程。能跑的部分：Android 开热点 → 出 SSID/密码 → 二号机连上 → 走标准 LAN 发现完成传输。

---

## P0 — 功能性缺陷（写了但没生效）

### 1. `PrpService.init()` 死代码，USB 可用性永远不生效
`prp_provider.dart:105-117`：fire-and-forget 里算出 `isUsbAvailable` 后**什么都没做**——只做了个 if 判断，body 是空的。`PrpState.isUsbTetheringAvailable` 永远 false，UI 永远不知道 USB 传输可用。
**修法**：init 完成后用 `ref.emitState` 或 notifier.state 真正写回状态；或把 availableTransports 的读取改成 reactive。

### 2. 原生→Dart 事件通道缺失（onPeerDiscovered 是装饰）
- Dart 侧 `onPeerDiscovered` / `onStateChanged` 两条 broadcast 流**永远不会有事件**——原生侧没有注册任何 EventChannel/反向回调。
- `UsbTetheringPlugin.kt:237` 附近，NetworkCallback 的 `onAvailable`/`onLost` 里注释自己写着 `"// Notify Flutter via method channel if needed"`——没做。
- 热点被系统/用户外部关闭（`onStopped`、BroadcastReceiver 收到 DISABLED）时 Dart 全然不知，UI 停留在 connected 假象。
**修法**：给两个 channel 各加一个 `EventChannel`，原生状态变化统一推 JSON 事件；Kotlin 的 receiver/callback 里补上 forward。

### 3. MethodChannel result 丢失 → Dart Future 永久挂起
`HotspotRelayPlugin.kt`：`startHotspot` 把 result 存进 `currentHotspotCallback` 后走异步回调。若首个回调未返回前再调一次 start，或 stop 先到，首个 result **永远不 reply** → Flutter 侧抛 MissingReplyException 或永久 await。且 `currentHotspotCallback`（`HotspotRelayPlugin.kt:46`）写入后从未被读——死变量。
**修法**：start 入口先检查 pending result 并立即 `error("BUSY")`；或删除死变量、用闭包捕获 result + Dart 侧超时兜底（见 P1-6）。

### 4. 状态机破洞
- `StartHostAction` 失败后 `mode` 留在 `host` + `state=error`，没有回 idle——UI 呈现"主机模式但出错"的矛盾态。
- `PrpConnectionState.transferring` 从未被任何代码设置（死枚举值）。
- `StopHostAction` 不校验 `stopActive()` 是否成功，直接报告 disconnected。
**修法**：失败分支 `mode: PrpMode.idle`；删掉 transferring 或真正接入传输流程；stop 结果落到 state。

### 5. TransportManager 切换传输用错方法
`transport_manager.dart:107/125`：切换前清理旧传输调用 `disconnect()`（client 语义）。对 wifi transport 而言 `disconnectWifi` ≠ `stopHotspot`——**从热点 host 切走时旧热点不会被关**，SSID 继续广播，reservation 泄漏。
**修法**：按旧 transport 的 `state` 分派：host 态调 `stop()`，client 态调 `disconnect()`。

---

## P1 — 健壮性

### 6. MethodChannel 无超时
所有 `invokeMethod` 裸等。native 挂了（含 P0-3 场景）Dart 永久 connecting。
**修法**：统一包一层 `invokeWithTimeout(method, args, 30s)`，超时落 error 态。

### 7. dispose 后写流
`stop()`→`dispose()` 竞态时 `_setState` 会对已 close 的 controller `add`，抛 StateError。
**修法**：加 `_isDisposed` 守卫，`_setState`/`_setError` 先查再发。

### 8. MainActivity 从不 dispose 插件
`MainActivity.kt` 没有 `cleanUpFlutterEngine`/`onDestroy` 清理：HotspotRelayPlugin 的 reservation、BroadcastReceiver、NetworkCallback，UsbTetheringPlugin 的 callback——全靠进程死亡回收。
**修法**：override `cleanUpFlutterEngine` 调两个插件的 `dispose()`。

### 9. `isHotspotRunning()` 反射 hidden API（API 28+ 被封）
只能靠自己的 `reservation != null` 兜底；系统里外部开启的热点识别不到，`startHotspot` 的 already-running 分支基本失效。可接受但要在注释里写明边界（现有注释已部分说明，补一句"仅识别本插件自建热点"）。

### 10. UI 非响应式读状态
`hotspot_relay_page.dart:74`：build 里 `prpService.notifier.availableTransports` 是命令式读取，availability 变化不触发重建（结合 P0-1 等于永远静态）。
**修法**：把 availableTransports 挂进 PrpState，页面 `ref.watch(prpProvider)`。

---

## P2 — 打磨与方向

### 11. `HostConfig.ssid/password` 被静默忽略
LocalOnlyHotspot 随机生成 SSID。要么实现自定义（Android 13 `SoftApConfiguration` 有路径），要么从接口删字段——别留"假装支持"。

### 12. `local_network_transport` 是 stub 却进了 availableTransports
若其 `isAvailable` 返回 true，UI 会展示一个不干活的传输项。评审时未逐行读，入修前先确认。

### 13.（方向性·重要）Windows 桌面端没有 PRP
`WifiHotspotTransport.isAvailable` 硬编码 `isAndroidPlatform`。当前拓扑（24h Windows 主机开热点 + 二号 Windows 机连热点）里 **PRP 完全不参与**——实际靠标准 LAN 发现覆盖。若要让 fork 在自家场景产生真价值，下一步是把 PRP 落到 Windows：host 侧用 Windows Mobile Hotspot API（WinRT `NetworkOperatorTetheringManager`，C++/winrt 或现成 Flutter 插件桥），client 侧用 WLAN API 自动 join。这比继续打磨 Android 端对用户的实际收益大。

### 14. PRP 层与核心收发流程脱钩
`prpProvider` 仅被 `hotspot_relay_page.dart` 引用，PeerInfo 流无消费者。短期可接受（热点网内 LAN 发现自然生效，PRP v1 定位=网络建立器而非数据通道），但 README 的 "peer relay" 措辞应收敛为 "network setup"，或长期把 PRP 接进 sender/receiver provider。

---

## 修复优先级建议

| 序 | 项 | 成本 | 收益 |
|---|---|---|---|
| 1 | P0-1 init 死代码 | 10 行 | USB 可用性生效 |
| 2 | P0-4 状态机破洞 | ~30 行 | UI 状态一致 |
| 3 | P0-5 切换用 stop | ~10 行 | 热点不泄漏 |
| 4 | P1-6 超时包装 | ~40 行 | UI 不再卡死 |
| 5 | P0-2 EventChannel | 中（双端） | 状态真实回传 |
| 6 | P0-3 + P1-7/P1-8/P1-10 | 小 | 收尾 |
| 7 | P2-13 Windows PRP | 大 | 自家拓扑真收益 |
