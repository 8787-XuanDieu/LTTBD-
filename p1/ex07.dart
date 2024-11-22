import 'dart:io';

void main() {
  // Nhập số nguyên từ bàn phím
  stdout.write("Nhập một số nguyên dương (n >= 1): ");
  int? n = int.tryParse(stdin.readLineSync()!);

  // Kiểm tra đầu vào
  if (n == null || n < 1) {
    print("Số nhập vào không hợp lệ. Vui lòng nhập một số nguyên dương (n >= 1).");
    return;
  }

  // Tính tổng các ước số
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }

  // Hiển thị kết quả
  print("Tổng các ước số của $n là: $sum");
}
