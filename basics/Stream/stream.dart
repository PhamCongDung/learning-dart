Stream<int> transmit() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  transmit().listen((x) => print(x));
}
