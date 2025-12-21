import 'dart:async';

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
  int get count => _storage.length;
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

class CounterStream {
  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;
  void emit(int count) {
    _controller.add(count);
  }

  void dispose() {
    _controller.close();
  }
}

void main() {
  final counter = CounterStream();
  counter.stream.listen((x) => print('Current user count : $x'));
  var repo = UserRepository();
  repo.add(User("1", "Dung", 33));
  counter.emit(repo.count);
  repo.add(User("2", "Thanh", 32));
  counter.emit(repo.count);
  try {
    repo.add(User("1", "Leo", 2));
  } on DuplicateUserException catch (e) {
    print("Error : $e");
  }
  var user_found = repo.findById("1");
  print("Found user : $user_found");
  try {
    repo.findById("100");
  } on UserNotFoundException catch (e) {
    print("Error : User not found : 100");
  }
  var all_user = repo.getAll();
  print("All user : \n $all_user");
  counter.dispose();
}
