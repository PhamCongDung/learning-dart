class Box<T> {
  T value;
  Box(this.value);
  void showType() {
    print("value: $value, Type : ${value.runtimeType}");
  }
}

void main() {
  var intBox = Box<int>(10);
  var stringBox = Box<String>("Flutter");
  intBox.showType();
  stringBox.showType();
}
