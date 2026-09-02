# 🚀 LocalSend Fork 稳定性加固 — 交付报告

> **交付时间**: 2026-06-20 06:16 GMT+8
> **Commit**: `d2949d83` (已推送至 `main`)
> **仓库**: https://github.com/ghshhf/localsend

---

## TL;DR
修复 3 个 P0 关键 Bug（Flutter 版本不一致、跨平台 crash、竞态条件），增强 CI/CD 健壮性，补齐 5 个核心模块测试，共 **+765 行 / -29 行**，已推送到 GitHub。

---

## 交付概览

| 指标 | 数值 |
|------|------|
| **Bug 修复** | 3 (P0) + 2 (P1) = **5 项** |
| **新增测试文件** | **5 个** (+717 行测试代码) |
| **CI 增强** | **2 项** (版本校验脚本 + CI 集成) |
| **总变更** | 12 文件, +765 / -29 行 |
| **QA 回合** | 2 轮 (发现 → 修复 → 通过) |

---

## 文件清单

### 🔧 Bug 修复 (6 文件修改)

| 文件 | 变更 | 说明 |
|------|------|------|
| `.fvmrc` | `3.38.10` → `3.35.6` | F-001: 统一 Flutter 版本与 CI 一致 |
| `app/pubspec.yaml` | +1 行注释 | 标注 CI 使用 Flutter 3.35.6 |
| `app/lib/util/transport/wifi_hotspot_transport.dart` | isAvailable 重写 | F-002: Platform.isAndroid 检测防 crash |
| `app/lib/provider/network/prp_provider.dart` | init() 重构 | F-003: 同步签名 + 防重复初始化 + 错误处理 |
| `app/lib/util/transport/transport_manager.dart` | init/dispose 增强 | F-004: 幂等检查 + try-catch 异常安全 |
| `.github/workflows/ci.yml` | +2 行 | F-005: 集成版本一致性检查步骤 |

### 🆕 新增文件 (7 文件)

| 文件 | 用途 | 测试数 |
|------|------|--------|
| `.github/scripts/version_check.sh` | CI 版本校验脚本 | — |
| `app/test/unit/provider/network/nearby_devices_provider_test.dart` | 设备发现核心逻辑 | 8 组 |
| `app/test/unit/provider/network/scan_facade_test.dart` | 扫描策略验证 | 3 组 |
| `app/test/unit/util/transport/transport_manager_test.dart` | 传输层管理器 | 9 组 |
| `app/test/unit/util/transport/wifi_hotspot_transport_test.dart` | WiFi 热点传输 | 6 组 |
| `common/test/unit/model/dto/dto_test.dart` | DTO 序列化/反序列化 | 12 组 |

---

## 修复详情

### P0-1: Flutter 版本统一 ✅
```
.fvmrc:          3.38.10 → 3.35.6
ci.yml:          3.35.6 (不变)
release.yml:     3.35.6 (不变)  
compile_apk.yml: 3.35.6 (不变)
```

### P0-2: 跨平台 Crash 修复 ✅
```dart
// Before: 硬编码 true，非 Android 调用 MethodChannel 会 crash
bool get isAvailable => true;

// After: 平台检测 + 异常兜底
bool get isAvailable {
  try {
    return Platform.isAndroid;
  } catch (e) {
    return false;
  }
}
```

### P0-3: PrpService 竞态条件修复 ✅
```dart
// Before: then() 无保护，状态可能丢失
@override
PrpState init() {
  _transportManager.init().then((_) { state = ... });
  return const PrpState();
}

// After: 同步签名(Refena兼容) + 防重复 + 错误处理
@override
PrpState init() {
  if (!_isInitializing) {
    _isInitializing = true;
    _transportManager.init().then((_) { ... })
      .catchError((e, st) => _logger.warning(...));
  }
  return const PrpState();
}
```

---

## GitHub Actions 构建建议

CI 配置 (`ci.yml`) 已添加 **Version consistency check** 步骤，在每次 push/PR 时自动运行：
1. 校验 pubspec.yaml 版本格式 (`x.y.z+buildNumber`)
2. 校验所有 workflow 的 FLUTTER_VERSION 一致性
3. 校验 .fvmrc 与 CI 版本匹配

**手动触发 Release 构建**:
- 进入 Actions → Build & Release → Run workflow
- 输入 version_tag: `v1.17.0-prp1`

---

## 用户下一步建议

1. **查看 CI 运行**: https://github.com/ghshhf/localsend/actions — 确认 format + test 全部通过
2. **本地测试** (如环境有 Flutter):
   ```bash
   fvm install 3.35.6 && fvm use 3.35.6
   cd app && flutter test test/unit/
   cd ../common && dart test test/unit/
   ```
3. **手动验证**: 在 Android 设备上安装，确认热点中继功能正常（非 Android 设备不 crash）
4. **后续优化**: 可考虑补充 send_provider / server_provider / isolate 通信的单元测试
