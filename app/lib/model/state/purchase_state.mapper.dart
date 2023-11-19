// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PurchaseState';

  static Map<PurchaseItem, String> _$prices(PurchaseState v) => v.prices;
  static const Field<PurchaseState, Map<PurchaseItem, String>> _f$prices =
      Field('prices', _$prices);
  static Map<PurchaseItem, PurchaseDetails> _$purchases(PurchaseState v) =>
      v.purchases;
  static const Field<PurchaseState, Map<PurchaseItem, PurchaseDetails>>
      _f$purchases = Field('purchases', _$purchases);
  static bool _$pending(PurchaseState v) => v.pending;
  static const Field<PurchaseState, bool> _f$pending =
      Field('pending', _$pending);

  @override
  final Map<Symbol, Field<PurchaseState, dynamic>> fields = const {
    #prices: _f$prices,
    #purchases: _f$purchases,
    #pending: _f$pending,
  };

  static PurchaseState _instantiate(DecodingData data) {
    return PurchaseState(
        prices: data.dec(_f$prices),
        purchases: data.dec(_f$purchases),
        pending: data.dec(_f$pending));
  }

  @override
  final Function instantiate = _instantiate;

  static PurchaseState fromJson(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PurchaseState>(map));
  }

  static PurchaseState deserialize(String json) {
    return _guard((c) => c.fromJson<PurchaseState>(json));
  }
}

mixin PurchaseStateMappable {
  String serialize() {
    return PurchaseStateMapper._guard((c) => c.toJson(this as PurchaseState));
  }

  Map<String, dynamic> toJson() {
    return PurchaseStateMapper._guard((c) => c.toMap(this as PurchaseState));
  }

  PurchaseStateCopyWith<PurchaseState, PurchaseState, PurchaseState>
      get copyWith => _PurchaseStateCopyWithImpl(
          this as PurchaseState, $identity, $identity);
  @override
  String toString() {
    return PurchaseStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PurchaseStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PurchaseStateMapper._guard((c) => c.hash(this));
  }
}

extension PurchaseStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PurchaseState, $Out> {
  PurchaseStateCopyWith<$R, PurchaseState, $Out> get $asPurchaseState =>
      $base.as((v, t, t2) => _PurchaseStateCopyWithImpl(v, t, t2));
}

abstract class PurchaseStateCopyWith<$R, $In extends PurchaseState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, PurchaseItem, String, ObjectCopyWith<$R, String, String>>
      get prices;
  MapCopyWith<$R, PurchaseItem, PurchaseDetails,
      ObjectCopyWith<$R, PurchaseDetails, PurchaseDetails>> get purchases;
  $R call(
      {Map<PurchaseItem, String>? prices,
      Map<PurchaseItem, PurchaseDetails>? purchases,
      bool? pending});
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
      get prices => MapCopyWith($value.prices,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(prices: v));
  @override
  MapCopyWith<$R, PurchaseItem, PurchaseDetails,
          ObjectCopyWith<$R, PurchaseDetails, PurchaseDetails>>
      get purchases => MapCopyWith($value.purchases,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(purchases: v));
  @override
  $R call(
          {Map<PurchaseItem, String>? prices,
          Map<PurchaseItem, PurchaseDetails>? purchases,
          bool? pending}) =>
      $apply(FieldCopyWithData({
        if (prices != null) #prices: prices,
        if (purchases != null) #purchases: purchases,
        if (pending != null) #pending: pending
      }));
  @override
  PurchaseState $make(CopyWithData data) => PurchaseState(
      prices: data.get(#prices, or: $value.prices),
      purchases: data.get(#purchases, or: $value.purchases),
      pending: data.get(#pending, or: $value.pending));

  @override
  PurchaseStateCopyWith<$R2, PurchaseState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PurchaseStateCopyWithImpl($value, $cast, t);
}
