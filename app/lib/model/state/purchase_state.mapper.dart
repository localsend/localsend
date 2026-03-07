// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'purchase_state.dart';

class PurchaseStateMapper extends ClassMapperBase<PurchaseState> {
  PurchaseStateMapper._();

  static PurchaseStateMapper? _instance;
  static PurchaseStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PurchaseStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PurchaseState';

  static Map<PurchaseItem, String> _$prices(PurchaseState v) => v.prices;
  static const Field<PurchaseState, Map<PurchaseItem, String>> _f$prices =
      Field('prices', _$prices);
  static Set<PurchaseItem> _$purchases(PurchaseState v) => v.purchases;
  static const Field<PurchaseState, Set<PurchaseItem>> _f$purchases = Field(
    'purchases',
    _$purchases,
  );
  static bool _$pending(PurchaseState v) => v.pending;
  static const Field<PurchaseState, bool> _f$pending = Field(
    'pending',
    _$pending,
  );

  @override
  final MappableFields<PurchaseState> fields = const {
    #prices: _f$prices,
    #purchases: _f$purchases,
    #pending: _f$pending,
  };

  static PurchaseState _instantiate(DecodingData data) {
    return PurchaseState(
      prices: data.dec(_f$prices),
      purchases: data.dec(_f$purchases),
      pending: data.dec(_f$pending),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PurchaseState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PurchaseState>(map);
  }

  static PurchaseState deserialize(String json) {
    return ensureInitialized().decodeJson<PurchaseState>(json);
  }
}

mixin PurchaseStateMappable {
  String serialize() {
    return PurchaseStateMapper.ensureInitialized().encodeJson<PurchaseState>(
      this as PurchaseState,
    );
  }

  Map<String, dynamic> toJson() {
    return PurchaseStateMapper.ensureInitialized().encodeMap<PurchaseState>(
      this as PurchaseState,
    );
  }

  PurchaseStateCopyWith<PurchaseState, PurchaseState, PurchaseState>
  get copyWith => _PurchaseStateCopyWithImpl<PurchaseState, PurchaseState>(
    this as PurchaseState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PurchaseStateMapper.ensureInitialized().stringifyValue(
      this as PurchaseState,
    );
  }

  @override
  bool operator ==(Object other) {
    return PurchaseStateMapper.ensureInitialized().equalsValue(
      this as PurchaseState,
      other,
    );
  }

  @override
  int get hashCode {
    return PurchaseStateMapper.ensureInitialized().hashValue(
      this as PurchaseState,
    );
  }
}

extension PurchaseStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PurchaseState, $Out> {
  PurchaseStateCopyWith<$R, PurchaseState, $Out> get $asPurchaseState =>
      $base.as((v, t, t2) => _PurchaseStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PurchaseStateCopyWith<$R, $In extends PurchaseState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, PurchaseItem, String, ObjectCopyWith<$R, String, String>>
  get prices;
  $R call({
    Map<PurchaseItem, String>? prices,
    Set<PurchaseItem>? purchases,
    bool? pending,
  });
  PurchaseStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PurchaseStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PurchaseState, $Out>
    implements PurchaseStateCopyWith<$R, PurchaseState, $Out> {
  _PurchaseStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PurchaseState> $mapper =
      PurchaseStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, PurchaseItem, String, ObjectCopyWith<$R, String, String>>
  get prices => MapCopyWith(
    $value.prices,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(prices: v),
  );
  @override
  $R call({
    Map<PurchaseItem, String>? prices,
    Set<PurchaseItem>? purchases,
    bool? pending,
  }) => $apply(
    FieldCopyWithData({
      if (prices != null) #prices: prices,
      if (purchases != null) #purchases: purchases,
      if (pending != null) #pending: pending,
    }),
  );
  @override
  PurchaseState $make(CopyWithData data) => PurchaseState(
    prices: data.get(#prices, or: $value.prices),
    purchases: data.get(#purchases, or: $value.purchases),
    pending: data.get(#pending, or: $value.pending),
  );

  @override
  PurchaseStateCopyWith<$R2, PurchaseState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PurchaseStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

