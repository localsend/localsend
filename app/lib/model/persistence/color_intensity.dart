enum ColorIntensity {
  off(null),
  low(16),
  medium(30),
  high(44)
  ;

  const ColorIntensity(this.neutralChroma);

  final int? neutralChroma; // null = default Material tone mapping
}
