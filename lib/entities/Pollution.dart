class Pollution {
  String status;
  Data data;

  Pollution({this.status, this.data});

  Pollution.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int aqi;
  int idx;
  City city;
  Iaqi iaqi;

  Data({this.aqi, this.idx, this.city, this.iaqi});

  Data.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    idx = json['idx'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    iaqi = json['iaqi'] != null ? new Iaqi.fromJson(json['iaqi']) : null;
  }
}

class Iaqi {
  Co co;
  No2 no2;
  O3 o3;
  Pm10 pm10;
  Pm25 pm25;
  So2 so2;

  Iaqi({
    this.co,
    this.no2,
    this.o3,
    this.pm10,
    this.pm25,
    this.so2,
  });

  Iaqi.fromJson(Map<String, dynamic> json) {
    co = json['co'] != null ? new Co.fromJson(json['co']) : null;
    no2 = json['no2'] != null ? new No2.fromJson(json['no2']) : null;
    o3 = json['o3'] != null ? new O3.fromJson(json['o3']) : null;
    pm10 = json['pm10'] != null ? new Pm10.fromJson(json['pm10']) : null;
    pm25 = json['pm25'] != null ? new Pm25.fromJson(json['pm25']) : null;
    so2 = json['so2'] != null ? new So2.fromJson(json['so2']) : null;
  }
}

class Co {
  dynamic v;

  Co({this.v});

  Co.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class No2 {
  dynamic v;

  No2({this.v});

  No2.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class O3 {
  dynamic v;

  O3({this.v});

  O3.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class Pm10 {
  dynamic v;

  Pm10({this.v});

  Pm10.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class Pm25 {
  dynamic v;

  Pm25({this.v});

  Pm25.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class So2 {
  dynamic v;

  So2({this.v});

  So2.fromJson(Map<String, dynamic> json) {
    v = json['v'] != null ? json['v'] : null;
  }
}

class City {
  List<double> geo;
  String name;
  String url;

  City({this.geo, this.name, this.url});

  City.fromJson(Map<String, dynamic> json) {
    geo = json['geo'].cast<double>();
    name = json['name'];
    url = json['url'];
  }
}
