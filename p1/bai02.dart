import 'dart:io';

void main() {
  // Khai báo biến cơ bản
  var ten = 'Tung'; // tự suy luận
  int tuoi = 25; // khai báo rõ ràng

  // Sử dụng null safety
  String? tenNullable;
  tenNullable = null;

  // Sử dụng biến late
  late String moTa;
  moTa = 'Lập trình Dart';

  // Sử dụng final và const
  final String quocGia = 'VietNam';
  const int nam = 2024;

  // In giá trị biến
  print('Tên: $ten');
  print('Tuổi: $tuoi');
  print('Mô tả: $moTa');
  print('Quốc gia: $quocGia');
  print('Năm: $nam');

  // Kiểm tra biến nullable
  int? soLuong1 = 5;
  print(soLuong1); // In giá trị để đảm bảo không lỗi

  // Kiểm tra biến nullable
  int? soLuong;
  assert(soLuong == null); // Điều kiện đúng vì soLuong chưa gán giá trị
  print(soLuong); // In giá trị null
}
