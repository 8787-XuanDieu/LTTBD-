import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai;
  List<HoaDon> _danhSachHoaDon;

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi)
      : _danhSachDienThoai = [],
        _danhSachHoaDon = [];

  // Phương thức thêm điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print('Đã thêm điện thoại: ${dienThoai.tenDienThoai}');
  }

  // Phương thức cập nhật điện thoại
  void capNhatDienThoai(String maDienThoai, String tenDienThoai, double giaBan) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.tenDienThoai = tenDienThoai;
        dt.giaBan = giaBan;
        print('Cập nhật thành công cho điện thoại mã: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  // Phương thức thêm hóa đơn
  void themHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua <= 0) {
      print('Số lượng mua không hợp lệ!');
      return;
    }
    if (!_danhSachDienThoai.contains(hoaDon.dienThoai)) {
      print('Điện thoại trong hóa đơn không có trong danh sách cửa hàng!');
      return;
    }
    _danhSachHoaDon.add(hoaDon);
    print('Đã thêm hóa đơn cho khách hàng: ${hoaDon.tenKhachHang}');
  }

  // Tìm kiếm điện thoại theo tên hoặc mã
  void timKiemDienThoai(String keyword) {
    var ketQua = _danhSachDienThoai.where((dt) =>
        dt.tenDienThoai.toLowerCase().contains(keyword.toLowerCase()) ||
        dt.maDienThoai.toLowerCase().contains(keyword.toLowerCase()));
    if (ketQua.isEmpty) {
      print('Không tìm thấy điện thoại nào với từ khóa: $keyword');
      return;
    }
    print('Kết quả tìm kiếm:');
    for (var dt in ketQua) {
      dt.hienThiThongTinDienThoai();
    }
  }

  // Thống kê doanh thu theo khoảng thời gian
  double thongKeDoanhThu(DateTime startDate, DateTime endDate) {
    double total = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (!hoaDon.ngayBan.isBefore(startDate) &&
          !hoaDon.ngayBan.isAfter(endDate)) {
        total += hoaDon.tinhTongTien();
      }
    }
    return total;
  }

  // Thống kê top điện thoại bán chạy
  void thongKeTopDienThoaiBanChay() {
    Map<String, int> soLuongBan = {};
    for (var hoaDon in _danhSachHoaDon) {
      String tenDienThoai = hoaDon.dienThoai.tenDienThoai;
      soLuongBan[tenDienThoai] = (soLuongBan[tenDienThoai] ?? 0) + hoaDon.soLuongMua;
    }
    if (soLuongBan.isEmpty) {
      print('Chưa có hóa đơn nào được ghi nhận!');
      return;
    }
    var sorted = soLuongBan.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    print('Top điện thoại bán chạy:');
    for (var entry in sorted) {
      print('${entry.key}: ${entry.value} cái');
    }
  }

  // Phương thức hiển thị thông tin cửa hàng
  void hienThiThongTinCuaHang() {
    print('Cửa hàng: $_tenCuaHang, Địa chỉ: $_diaChi');
    print('Số lượng điện thoại: ${_danhSachDienThoai.length}');
    print('Số lượng hóa đơn: ${_danhSachHoaDon.length}');
  }
}

// main.dart
void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang('Cửa hàng điện thoại XYZ', '123 Đường ABC');

  // Tạo điện thoại
  DienThoai dt1 = DienThoai('DT-001', 'Samsung Galaxy S21', 'Samsung', 12000000, true);
  DienThoai dt2 = DienThoai('DT-002', 'iPhone 16', 'Apple', 20000000, true);

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Tạo và thêm hóa đơn
  HoaDon hoaDon1 = HoaDon(DateTime.now(), dt1, 1, 'Đào Xuân Diệu', '0868254477');
  HoaDon hoaDon2 = HoaDon(DateTime.now(), dt2, 1, 'Lê Hưng Thiện Trí', '0987654321');

  cuaHang.themHoaDon(hoaDon1);
  cuaHang.themHoaDon(hoaDon2);

  // Hiển thị thông tin cửa hàng
  cuaHang.hienThiThongTinCuaHang();

  // Tìm kiếm điện thoại
  print('\nKết quả tìm kiếm điện thoại:');
  cuaHang.timKiemDienThoai('Samsung');

  // Thống kê doanh thu
  double doanhThu = cuaHang.thongKeDoanhThu(
    DateTime.now().subtract(Duration(days: 30)),
    DateTime.now(),
  );
  print('\nDoanh thu trong 30 ngày qua: ${doanhThu.toStringAsFixed(2)} VND');

  // Thống kê top điện thoại bán chạy
  cuaHang.thongKeTopDienThoaiBanChay();
}
