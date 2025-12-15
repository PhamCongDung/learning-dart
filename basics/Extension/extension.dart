extension StringX on String {
  bool get isEmail {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(this);
  }

  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension ListintX on List<int> {
  int get sum => this.fold(0, (total, x) => total + x);
  double get average => isEmpty ? 0 : this.sum / this.length;
}

extension Iterablex<T> on Iterable<T> {
  T? get firstOrNull => this.isEmpty ? null : first;
}

void main() {
  var email = "phamcongdung92@gmail.com";
  print(email.isEmail);
  var notEmail = "dungpham123";
  print(notEmail.isEmail);
  //test capitalize
  print(email.capitalize());
  var listInt = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print("Sum : ${listInt.sum}");
  print("Average : ${listInt.average}");
}
