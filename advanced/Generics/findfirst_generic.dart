T? findFirst<T>(List<T> items, bool Function(T) test) {
  for (var item in items) {
    if (test(item)) {
      return item;
    }
  }
}

void main() {
  var result = findFirst<int>([1, 2, 3, 4, 5, 6, 7, 8], (x) => x % 2 == 0);
  print(result);
  var test = findFirst<String>(['a', 'b', 'hello', 'hi'], (x) => x.length > 2);
  print(test);
}
