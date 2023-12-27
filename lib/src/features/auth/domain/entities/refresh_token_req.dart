class RefreshTokenReq {
  final String refresh;
  RefreshTokenReq({
    required this.refresh,
  });

  @override
  bool operator ==(covariant RefreshTokenReq other) {
    if (identical(this, other)) return true;

    return other.refresh == refresh;
  }

  @override
  int get hashCode => refresh.hashCode;
}
