Future<int> getNumber() async {
  await Future.delayed(Duration(seconds: 10));
  return 10;
}

Future<int> divide(int a, int b) async {
  if (b == 0) {
    throw Exception("Cannot divide by zero");
  } else {
    return a ~/ b;
  }
}

Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 10));
  return "Dung";
}

void main() async {
  // TODO excercise 2
  print("Start");
  var num = await getNumber();
  print("$num");
  print("End");
  // TODO exercise 3
  try {
    var result = await divide(10, 0);
  } catch (e) {
    print(e);
  }
  // TODO exercise 4
  var name = await fetchUserName();
  print("$name");
  // TODO excercise 5
  var nameNotAwait = fetchUserName();
  print("Name missing await : $nameNotAwait");
}
