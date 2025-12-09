class User {
  String name;
  int age;
  bool active;
  User(this.name, this.age, this.active);
  @override
  String toString() => 'User(name : $name, age : $age, active : $active)';
}

void main() {
  var listuser = <User>[];
  var Dung = User("Dung", 33, true);
  var Thanh = User("Thanh", 32, true);
  var Leo = User("Leo", 2, false);
  var Tuan = User("Tuan", 55, false);
  listuser.add(Dung);
  listuser.add(Thanh);
  listuser.add(Leo);
  listuser.add(Tuan);

  print("List user : $listuser");

  var over20 = listuser.where((x) => x.age > 20).toList();
  print("Users has age more than 20 : $over20");

  listuser.sort((a, b) => b.age.compareTo(a.age));
  print("Age decrease : $listuser");

  var names = listuser.map((x) => x.name).toList();
  print("User name : $names");

  var active = listuser.any((x) => x.active);
  print("Is any active : $active");

  var all_active = listuser.every((x) => x.active);
  print("Is all users active : $all_active");

  var sum_age_active = listuser
      .where((x) => x.active)
      .toList()
      .fold(0, (sum, x) => sum + x.age);
  print("Total age active users : $sum_age_active");

  var active_user = listuser.where((x) => x.active);
  print("List of active users : $active_user");

  var inactive_user = listuser.where((x) => !x.active);
  print("List of inactive users : $inactive_user");
}
