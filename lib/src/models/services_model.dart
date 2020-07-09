class Services {
  List<Service> items = new List();

  Services();

  Services.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final service = new Service.fromJson(item);
      items.add(service);
    }
  }
}

class Service {
  User user;
  Vehicle vehicle;

  Service({this.user, this.vehicle});

  Map<String, dynamic> toJson() => {
        "user": user,
        "vehicle": vehicle,
      };

  Service.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        vehicle = Vehicle.fromJson(json["vehicle"]);

  @override
  String toString() => '$user $vehicle';
}

class Vehicle {
  String brand;
  String model;
  String colour;
  String licensePlate;

  Vehicle({
    this.brand,
    this.model,
    this.colour,
    this.licensePlate,
  });

  Vehicle.fromJson(Map<String, dynamic> json)
      : brand = json["brand"],
        model = json["model"],
        colour = json["colour"],
        licensePlate = json["licensePlate"];

  @override
  String toString() => '$brand $model $colour $licensePlate';
}

class User {
  String firstName;
  String lastName;

  User({
    this.firstName,
    this.lastName,
  });

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["firstName"],
        lastName = json["lastName"];

  @override
  String toString() => '$firstName $lastName';
}
