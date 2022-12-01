class CounterDataSource {
  const CounterDataSource();

  Future<int> increase(int value) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => value + 1,
    );
  }

  Future<int> decrease(int value) async {
    if (value <= 0) return value;

    return Future.delayed(
      const Duration(seconds: 3),
      () => value - 1,
    );
  }

  Future<int> reset() async {
    return Future.delayed(
      const Duration(seconds: 5),
      () => 0,
    );
  }
}
