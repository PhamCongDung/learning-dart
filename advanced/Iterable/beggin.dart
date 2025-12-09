main() {
  var nums = [1, 2, 3, 4, 5, 6];
  var odd = nums.where((x) => x.isOdd).toList();
  print("Odd : $odd");
  var double_odd = odd.map((x) => x * 2).toList();
  print("Double odd : $double_odd");
  var sum = nums.reduce((a, b) => a + b);
  print("sum : $sum");
  var merge = [0, ...?double_odd];
  print("Merged : $merge");
}
