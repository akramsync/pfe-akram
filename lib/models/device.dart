class Device {
  List<Devices>? devices;

  Device({this.devices});

  Device.fromJson(Map<String, dynamic> json) {
    if (json['devices'] != null) {
      devices = <Devices>[];
      json['devices'].forEach((v) {
        devices!.add(Devices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (devices != null) {
      data['devices'] = devices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Devices {
  String? sId;
  String? nom;
  String? numRo;
  String? email;
  String? matricule;
  String? adresse;
  int? iV;
  String? telephone;
  String? address;

  Devices(
      {this.sId,
      this.nom,
      this.numRo,
      this.email,
      this.matricule,
      this.adresse,
      this.iV,
      this.telephone,
      this.address});

  Devices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nom = json['nom'];
    numRo = json['numéro'];
    email = json['email'];
    matricule = json['matricule'];
    adresse = json['adresse'];
    iV = json['__v'];
    telephone = json['telephone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['nom'] = nom;
    data['numéro'] = numRo;
    data['email'] = email;
    data['matricule'] = matricule;
    data['adresse'] = adresse;
    data['__v'] = iV;
    data['telephone'] = telephone;
    data['address'] = address;
    return data;
  }
}
