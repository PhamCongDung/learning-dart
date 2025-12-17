# 🧩 MINI PROJECT DART
## User Management + Realtime Counter (Console App)

> 🎯 Mục tiêu  
> Tổng hợp toàn bộ kiến thức Dart nền tảng trước khi học Flutter:
> - OOP
> - Generic
> - Exception
> - Extension
> - Future / async
> - Stream / StreamController

---

## 🧠 TƯ DUY CHUNG

Đây là **logic lõi của một app Flutter**, chỉ thiếu UI.

- Data → Repository
- Action → StreamController
- Error → Exception
- Code đẹp → Extension

---

## 📁 CẤU TRÚC PROJECT

👉 **Chỉ 1 file duy nhất**

```dart
// main.dart

// 1. Model
// 2. Exception
// 3. Repository
// 4. Extension
// 5. Stream / Controller
// 6. main()

1️⃣ MODEL – USER

Yêu cầu

Tạo class User với:
	•	id (String)
	•	name (String)
	•	age (int)

Có:
	•	constructor
	•	toString()

⸻

2️⃣ EXCEPTION

Tạo 2 custom exception:

1. DuplicateUserException
	•	dùng khi add user trùng id

2. UserNotFoundException
	•	dùng khi tìm user không tồn tại

👉 Mỗi exception:
	•	có message
	•	override toString()

⸻

3️⃣ REPOSITORY

Abstract Repository
abstract class Repository<T> {
  void add(T item);
  T findById(String id);
  List<T> getAll();
}

UserRepository implements Repository

Yêu cầu
	•	Lưu trữ List<User> private
	•	add(User user)
	•	nếu trùng id → throw DuplicateUserException
	•	findById(String id)
	•	nếu không tìm thấy → throw UserNotFoundException
	•	getAll()
	•	trả về List.unmodifiable

⸻

4️⃣ EXTENSION

Extension cho List<User>
extension UserListX on List<User> {
  User? findByIdOrNull(String id);
}
👉 Không throw exception
👉 Trả null nếu không tìm thấy

⸻

5️⃣ STREAM – REALTIME COUNTER

Yêu cầu
	•	Tạo StreamController<int> (broadcast)
	•	Mỗi khi:
	•	add user thành công
	•	(optional) remove user
	•	Bắn ra:
	•	số lượng user hiện tại

👉 Đây chính là logic realtime UI trong Flutter

⸻

6️⃣ MAIN – FLOW CHẠY CHƯƠNG TRÌNH

A. Listen stream
counterStream.listen((count) {
  print("Current user count: $count");
});
. Test case bắt buộc
	1.	Add user hợp lệ
	2.	Add user trùng id (bắt exception)
	3.	Tìm user tồn tại
	4.	Tìm user không tồn tại (bắt exception)
	5.	In toàn bộ user

👉 Phải dùng try / catch đúng chỗ

⸻

📤 OUTPUT MONG MUỐN (KHÔNG CẦN GIỐNG 100%)
Current user count: 1
Current user count: 2
Error: Duplicate user id: 1
Found user: User(id: 1, name: Dung, age: 33)
Error: User not found: 100
All users:
User(id: 1, name: Dung, age: 33)
User(id: 2, name: Thanh, age: 32)

✅ CHECKLIST HOÀN THÀNH
	•	Class + abstract
	•	Custom exception
	•	Extension
	•	StreamController + broadcast
	•	try / catch đúng chỗ
	•	Code chạy không crash

