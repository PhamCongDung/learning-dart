class Stack<T> {
  List<T> _items = [];
  List<T> get items => _items;
  void push(T item) {
    _items.add(item);
  }

  T? pop() {
    if (_items.isEmpty) return null;
    return _items.removeLast();
  }

  T? peek() {
    if (_items.isEmpty) return null;
    return _items.last;
  }

  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
  @override
  String toString() => _items.toString();
}

void main() {
  var intstack = Stack<int>();
  intstack.push(1);
  intstack.push(100);
  intstack.push(4);
  print("$intstack");
  intstack.pop();
  print("$intstack");
  intstack.pop();
  print("$intstack");
}
