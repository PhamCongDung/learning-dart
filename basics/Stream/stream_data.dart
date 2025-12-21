import 'dart:async';

void main() async {
  // 1️⃣ Tạo StreamController
  final controller = StreamController<int>();

  // 2️⃣ Lấy stream từ controller
  final stream = controller.stream;

  // 3️⃣ Lắng nghe stream (listener)
  final subscription = stream
      .map((value) => value * 2) // xử lý dữ liệu
      .listen(
        (value) {
          print('Nhận được: $value');
        },
        onDone: () {
          print('Stream đã kết thúc');
        },
      );

  // 4️⃣ Phát dữ liệu vào stream
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('Phát: $i');
    controller.add(i);
  }

  // 5️⃣ Đóng stream
  await Future.delayed(Duration(seconds: 1));
  await controller.close();

  // 6️⃣ Huỷ lắng nghe (best practice)
  await subscription.cancel();
}
