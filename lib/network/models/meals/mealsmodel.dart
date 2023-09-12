class mealsmodel {
  List<Meals>? meals;

  mealsmodel({this.meals});

  mealsmodel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? sId;
  String? name;
  String? description;
  ChefId? chefId;
  String? status;

  Meals({this.sId, this.name, this.description, this.chefId, this.status});

  Meals.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    chefId =
    json['chefId'] != null ? new ChefId.fromJson(json['chefId']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.chefId != null) {
      data['chefId'] = this.chefId!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ChefId {
  String? sId;
  String? name;
  String? phone;
  String? email;

  ChefId({this.sId, this.name, this.phone, this.email});

  ChefId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
