class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaBan;
  bool _tonKho;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaBan, this._tonKho) ;

  // Getter cho mã điện thoại
  String get maDienThoai => _maDienThoai;

  // Getter cho tên điện thoại
  String get tenDienThoai => _tenDienThoai;

  // Getter cho hãng sản xuất
  String get hangSanXuat => _hangSanXuat;

  // Getter cho giá bán
  double get giaBan => _giaBan;

  // Getter cho tình trạng tồn kho
  bool get tonKho => _tonKho;

  // Setter cho mã điện thoại
  set maDienThoai(String value) {
    _maDienThoai = (maDienThoai.isNotEmpty)? maDienThoai: _maDienThoai;
  }

  // Setter cho tên điện thoại
  set tenDienThoai(String tenDienThoai  ) {
   _tenDienThoai = (tenDienThoai.isNotEmpty)? tenDienThoai: _tenDienThoai;
  }

  // Setter cho hãng sản xuất
  set hangSanXuat(String value) {
   _hangSanXuat = (hangSanXuat.isNotEmpty)? hangSanXuat: _hangSanXuat;
  }

  // Setter cho giá bán
  set giaBan(double giaBan) {
    if (giaBan <= 0) {
      _giaBan = giaBan;
    }
  }

  // Setter cho tình trạng tồn kho
  set tonKho(bool tonKho) {
    _tonKho =tonKho;
  }

  // Phương thức hiển thị thông tin điện thoại
  void hienThiThongTinDienThoai() {
    print('Thông tin điện thoại:');
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá bán: $_giaBan');
    print('Tình trạng tồn kho: ${_tonKho ? "Có" : "Hết"}');
  }
}