import 'dienthoai.dart';
import 'hoadon.dart';
import 'cuahang.dart';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang('Cửa hàng điện thoại XYZ', '123 Đường ABC');

  // Tạo danh sách điện thoại
  DienThoai dt1 = DienThoai('DT-001', 'Samsung Galaxy S21', 'Samsung', 12000000, true);
  DienThoai dt2 = DienThoai('DT-002', 'iPhone 16', 'Apple', 20000000, true);
  DienThoai dt3 = DienThoai('DT-003', 'Xiaomi Mi 11', 'Xiaomi', 10000000, true);

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  cuaHang.themDienThoai(dt3);

  // Tạo hóa đơn
  HoaDon hoaDon1 = HoaDon(DateTime.now(), dt1, 2, 'Đào Xuân Diệu', '0868254477');
  HoaDon hoaDon2 = HoaDon(DateTime.now(), dt2, 1, 'Lê Hưng Thiện Trí', '0987654321');
  HoaDon hoaDon3 = HoaDon(DateTime.now(), dt1, 1, 'Huỳnh Trọng Tín', '0933344556');

  // Thêm hóa đơn vào cửa hàng
  cuaHang.themHoaDon(hoaDon1);
  cuaHang.themHoaDon(hoaDon2);
  cuaHang.themHoaDon(hoaDon3);

  // Hiển thị thông tin cửa hàng
  cuaHang.hienThiThongTinCuaHang();

  // Tìm kiếm điện thoại theo từ khóa
  print('\nTìm kiếm điện thoại với từ khóa "Samsung":');
  cuaHang.timKiemDienThoai('Samsung');

  // Thống kê doanh thu trong 30 ngày qua
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now();
  double doanhThu = cuaHang.thongKeDoanhThu(startDate, endDate);
  print('\nDoanh thu từ ${startDate.toString()} đến ${endDate.toString()}: ${doanhThu.toStringAsFixed(2)} VND');

  // Thống kê top điện thoại bán chạy
  print('\nThống kê top điện thoại bán chạy:');
  cuaHang.thongKeTopDienThoaiBanChay();
}
