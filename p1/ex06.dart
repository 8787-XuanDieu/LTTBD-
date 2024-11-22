import 'dart:io';

void main() {
  // Nhập số nguyên từ bàn phím
  stdout.write("Nhập số nguyên dương (n >= 1): ");
  int? n = int.tryParse(stdin.readLineSync()!);

  // Kiểm tra đầu vào
  if (n == null || n < 1) {
    print("Số nhập vào không hợp lệ. Vui lòng nhập số nguyên dương (n >= 1).");
    return;
  }

  // Chuyển đổi số nguyên sang nhị phân
  String binary = n.toRadixString(2);

  // Hiển thị kết quả
  print("Số nhị phân tương ứng: $binary");
}
