// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'receive_page_controller.dart';

class ReceivePageVmMapper extends ClassMapperBase<ReceivePageVm> {
  ReceivePageVmMapper._();

  static ReceivePageVmMapper? _instance;
  static ReceivePageVmMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReceivePageVmMapper._());
      DeviceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReceivePageVm';

  static SessionStatus? _$status(ReceivePageVm v) => v.status;
  static const Field<ReceivePageVm, SessionStatus> _f$status = Field('status', _$status);
  static Device _$sender(ReceivePageVm v) => v.sender;
  static const Field<ReceivePageVm, Device> _f$sender = Field('sender', _$sender);
  static bool _$showSenderInfo(ReceivePageVm v) => v.showSenderInfo;
  static const Field<ReceivePageVm, bool> _f$showSenderInfo = Field('showSenderInfo', _$showSenderInfo);
  static int _$fileCount(ReceivePageVm v) => v.fileCount;
  static const Field<ReceivePageVm, int> _f$fileCount = Field('fileCount', _$fileCount);
  static String? _$message(ReceivePageVm v) => v.message;
  static const Field<ReceivePageVm, String> _f$message = Field('message', _$message);
  static bool _$isLink(ReceivePageVm v) => v.isLink;
  static const Field<ReceivePageVm, bool> _f$isLink = Field('isLink', _$isLink);
  static bool _$showFullIp(ReceivePageVm v) => v.showFullIp;
  static const Field<ReceivePageVm, bool> _f$showFullIp = Field('showFullIp', _$showFullIp);
  static void Function() _$onAccept(ReceivePageVm v) => v.onAccept;
  static const Field<ReceivePageVm, void Function()> _f$onAccept = Field('onAccept', _$onAccept);
  static void Function() _$onDecline(ReceivePageVm v) => v.onDecline;
  static const Field<ReceivePageVm, void Function()> _f$onDecline = Field('onDecline', _$onDecline);
  static void Function() _$onClose(ReceivePageVm v) => v.onClose;
  static const Field<ReceivePageVm, void Function()> _f$onClose = Field('onClose', _$onClose);

  @override
  final MappableFields<ReceivePageVm> fields = const {
    #status: _f$status,
    #sender: _f$sender,
    #showSenderInfo: _f$showSenderInfo,
    #fileCount: _f$fileCount,
    #message: _f$message,
    #isLink: _f$isLink,
    #showFullIp: _f$showFullIp,
    #onAccept: _f$onAccept,
    #onDecline: _f$onDecline,
    #onClose: _f$onClose,
  };

  static ReceivePageVm _instantiate(DecodingData data) {
    return ReceivePageVm(
        status: data.dec(_f$status),
        sender: data.dec(_f$sender),
        showSenderInfo: data.dec(_f$showSenderInfo),
        fileCount: data.dec(_f$fileCount),
        message: data.dec(_f$message),
        isLink: data.dec(_f$isLink),
        showFullIp: data.dec(_f$showFullIp),
        onAccept: data.dec(_f$onAccept),
        onDecline: data.dec(_f$onDecline),
        onClose: data.dec(_f$onClose));
  }

  @override
  final Function instantiate = _instantiate;

  static ReceivePageVm fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReceivePageVm>(map);
  }

  static ReceivePageVm deserialize(String json) {
    return ensureInitialized().decodeJson<ReceivePageVm>(json);
  }
}

mixin ReceivePageVmMappable {
  String serialize() {
    return ReceivePageVmMapper.ensureInitialized().encodeJson<ReceivePageVm>(this as ReceivePageVm);
  }

  Map<String, dynamic> toJson() {
    return ReceivePageVmMapper.ensureInitialized().encodeMap<ReceivePageVm>(this as ReceivePageVm);
  }

  ReceivePageVmCopyWith<ReceivePageVm, ReceivePageVm, ReceivePageVm> get copyWith =>
      _ReceivePageVmCopyWithImpl(this as ReceivePageVm, $identity, $identity);
  @override
  String toString() {
    return ReceivePageVmMapper.ensureInitialized().stringifyValue(this as ReceivePageVm);
  }

  @override
  bool operator ==(Object other) {
    return ReceivePageVmMapper.ensureInitialized().equalsValue(this as ReceivePageVm, other);
  }

  @override
  int get hashCode {
    return ReceivePageVmMapper.ensureInitialized().hashValue(this as ReceivePageVm);
  }
}

extension ReceivePageVmValueCopy<$R, $Out> on ObjectCopyWith<$R, ReceivePageVm, $Out> {
  ReceivePageVmCopyWith<$R, ReceivePageVm, $Out> get $asReceivePageVm => $base.as((v, t, t2) => _ReceivePageVmCopyWithImpl(v, t, t2));
}

abstract class ReceivePageVmCopyWith<$R, $In extends ReceivePageVm, $Out> implements ClassCopyWith<$R, $In, $Out> {
  DeviceCopyWith<$R, Device, Device> get sender;
  $R call(
      {SessionStatus? status,
      Device? sender,
      bool? showSenderInfo,
      int? fileCount,
      String? message,
      bool? isLink,
      bool? showFullIp,
      void Function()? onAccept,
      void Function()? onDecline,
      void Function()? onClose});
  ReceivePageVmCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReceivePageVmCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ReceivePageVm, $Out>
    implements ReceivePageVmCopyWith<$R, ReceivePageVm, $Out> {
  _ReceivePageVmCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReceivePageVm> $mapper = ReceivePageVmMapper.ensureInitialized();
  @override
  DeviceCopyWith<$R, Device, Device> get sender => $value.sender.copyWith.$chain((v) => call(sender: v));
  @override
  $R call(
          {Object? status = $none,
          Device? sender,
          bool? showSenderInfo,
          int? fileCount,
          Object? message = $none,
          bool? isLink,
          bool? showFullIp,
          void Function()? onAccept,
          void Function()? onDecline,
          void Function()? onClose}) =>
      $apply(FieldCopyWithData({
        if (status != $none) #status: status,
        if (sender != null) #sender: sender,
        if (showSenderInfo != null) #showSenderInfo: showSenderInfo,
        if (fileCount != null) #fileCount: fileCount,
        if (message != $none) #message: message,
        if (isLink != null) #isLink: isLink,
        if (showFullIp != null) #showFullIp: showFullIp,
        if (onAccept != null) #onAccept: onAccept,
        if (onDecline != null) #onDecline: onDecline,
        if (onClose != null) #onClose: onClose
      }));
  @override
  ReceivePageVm $make(CopyWithData data) => ReceivePageVm(
      status: data.get(#status, or: $value.status),
      sender: data.get(#sender, or: $value.sender),
      showSenderInfo: data.get(#showSenderInfo, or: $value.showSenderInfo),
      fileCount: data.get(#fileCount, or: $value.fileCount),
      message: data.get(#message, or: $value.message),
      isLink: data.get(#isLink, or: $value.isLink),
      showFullIp: data.get(#showFullIp, or: $value.showFullIp),
      onAccept: data.get(#onAccept, or: $value.onAccept),
      onDecline: data.get(#onDecline, or: $value.onDecline),
      onClose: data.get(#onClose, or: $value.onClose));

  @override
  ReceivePageVmCopyWith<$R2, ReceivePageVm, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _ReceivePageVmCopyWithImpl($value, $cast, t);
}
