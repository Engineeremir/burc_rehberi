class Burc{
  String _burcAdi;
  String _burcTarih;
  String _burcDetay;
  String _burcKucukResim;
  String _burcBuyukResim;

  Burc(this._burcAdi, this._burcTarih, this._burcDetay, this._burcKucukResim,
      this._burcBuyukResim);

  String get burcBuyukResim => _burcBuyukResim;

  set burcBuyukResim(String value) {
    _burcBuyukResim = value;
  }

  String get burcKucukResim => _burcKucukResim;

  set burcKucukResim(String value) {
    _burcKucukResim = value;
  }

  String get burcDetay => _burcDetay;

  set burcDetay(String value) {
    _burcDetay = value;
  }

  String get burcTarih => _burcTarih;

  set burcTarih(String value) {
    _burcTarih = value;
  }

  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }
}