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