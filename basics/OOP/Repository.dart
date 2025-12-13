abstract class Entity {
  String get id;
}

class User extends Entity {
  @override
  final String id;
  final String name;
  final int age;
  User(this.id, this.name, this.age);
  @override
  String toString() => 'User(id : $id, name : $name, age : $age)';
}

abstract class Repository<T extends Entity> {
  void add(T item);
  T? findById(String id);
  void remove(String id);
  List<T> getAll();
}

class UserRepository implements Repository<User> {
  final List<User> _storage = [];

  @override
  void add(User user) {
    _storage.add(user);
  }

  @override
  User? findById(String id) {
    final index = _storage.indexWhere((x) => x.id == id);
    return index == -1 ? null : _storage[index];
  }

  @override
  void remove(String id) {
    _storage.removeWhere((x) => x.id == id);
  }

  @override
  List<User> getAll() => List.unmodifiable(_storage);
}

void main() {
  var repo = UserRepository();
  repo.add(User("1", "Dung", 33));
  repo.add(User("2", "Thanh", 32));

  print(repo.getAll());
  print(repo.findById("1"));
  repo.remove("1");
  print(repo.getAll());
}
