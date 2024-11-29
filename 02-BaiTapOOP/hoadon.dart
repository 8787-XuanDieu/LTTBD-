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
