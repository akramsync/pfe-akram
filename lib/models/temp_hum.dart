class TempHum {
  String? sId;
  String? deviceId;
  num? temperature;
  num? humidity;
  String? timestamp;
  int? iV;

  TempHum(
      {this.sId,
      this.deviceId,
      this.temperature,
      this.humidity,
      this.timestamp,
      this.iV});

  TempHum.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceId = json['deviceId'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    timestamp = json['timestamp'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['deviceId'] = deviceId;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['timestamp'] = timestamp;
    data['__v'] = iV;
    return data;
  }
}
