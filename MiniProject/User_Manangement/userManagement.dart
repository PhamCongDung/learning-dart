class User {
  String id;
  String name;
  int age;
  User(this.id, this.name, this.age);
  @override
  String toString() => 'User(id : $id, name : $name, age : $age)';
}

class DuplicateUserException implements Exception {
  final String message;
  DuplicateUserException(this.message);
  @override
  String toString() => message;
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
  @override
  String toString() => message;
}

abstract class Repository<T> {
  void add(T item);
  T findById(String id);
  List<T> getAll();
}

class UserRepository implements Repository<User> {
  final List<User> _storage = [];
  @override
  void add(User user) {
    if (_storage.any((x) => x.id == user.id)) {
      throw DuplicateUserException("Duplicate id : ${user.id}");
    }
    _storage.add(user);
  }

  @override
  User findById(String id) {
    final index = _storage.indexWhere((x) => x.id == id);
    return index == -1
        ? throw UserNotFoundException("User not found by id : $id")
        : _storage[index];
  }

  @override
  List<User> getAll() => List.unmodifiable(_storage);
}

extension UserListX on List<User> {
  User? findByIdOrNull(String id) {
    final index = this.indexWhere((x) => x.id == id);
    return index == -1 ? null : this[index];
  }
}
