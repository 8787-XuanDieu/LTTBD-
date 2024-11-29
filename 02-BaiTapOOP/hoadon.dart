import 'dienthoai.dart';
class HoaDon {
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  String _tenKhachHang;
  String _soDienThoaiKhachHang;

  HoaDon(this._ngayBan, this._dienThoai, this._soLuongMua, this._tenKhachHang, this._soDienThoaiKhachHang) ;

  // Getter cho ngày bán
  DateTime get ngayBan => _ngayBan;

  // Getter cho điện thoại
  DienThoai get dienThoai => _dienThoai;

  // Getter cho số lượng mua
  int get soLuongMua => _soLuongMua;

  // Getter cho tên khách hàng
  String get tenKhachHang => _tenKhachHang;

  // Getter cho số điện thoại khách hàng
  String get soDienThoaiKhachHang => _soDienThoaiKhachHang;

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _dienThoai.giaBan * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Thông tin hóa đơn:');
    print('Ngày bán: $_ngayBan');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại: $_soDienThoaiKhachHang');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Tổng tiền: ${tinhTongTien()}');
  }
}

void main() {
  // Tạo đối tượng điện thoại
  DienThoai dienThoai = DienThoai('DT-001', 'Samsung Galaxy S21', 'Samsung', 12000000, true);

  // Tạo hóa đơn
  try {
    HoaDon hoaDon = HoaDon(DateTime.now(), dienThoai, 3, 'Đào xuân diệu', '00868254477');
    
    // Hiển thị thông tin hóa đơn
    hoaDon.hienThiThongTinHoaDon();
  } catch (e) {
    print(e);
  }
}