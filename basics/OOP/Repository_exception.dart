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
    if (_storage.any((x) => x.id == user.id)) {
      throw DuplicateIdException("Duplicate id : ${user.id}");
    }
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

  User findByIdOrThrow(String id) {
    final index = _storage.indexWhere((u) => u.id == id);
    return index == -1
        ? throw NotFoundException("Not Found : $id")
        : _storage[index];
  }

  void removeOrThrow(String id) {
    final index = _storage.indexWhere((u) => u.id == id);
    if (index == -1) {
      throw NotFoundException("Not Found : $id");
    } else {
      _storage.removeAt(index);
    }
  }
}

// Exception Definition
class DuplicateIdException implements Exception {
  final String message;
  DuplicateIdException(this.message);
  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
  @override
  String toString() => message;
}

void main() {
  var repo = UserRepository();
  // case A : Add Ok
  repo.add(User("1", "Dung", 33));
  repo.add(User("2", "Thanh", 32));

  print(repo.getAll());
  print(repo.findById("1"));
  repo.remove("1");
  print(repo.getAll());
  // Case B : Duplicate id
  print("Test Case B");
  try {
    repo.add(User("2", "Dung", 33));
  } on DuplicateIdException catch (e, stack) {
    print(e);
    print(stack);
  }
  // Case C
  print("Test Case C");
  try {
    repo.findByIdOrThrow("5");
    repo.removeOrThrow("100");
  } on NotFoundException catch (e) {
    print(e);
  }
}
