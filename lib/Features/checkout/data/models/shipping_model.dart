import 'package:fruit_market/Features/checkout/domain/entities/shippimg_address_entity.dart';

class ShippingAddressModel {
  final String? name;
  final String? address;
  final String? city;
  final String? email;
  final String? phone;
  final String? addressDescription;

  ShippingAddressModel({
    required this.name,
    required this.address,
    required this.city,
    required this.email,
    required this.phone,
    required this.addressDescription,
  });

  factory ShippingAddressModel.fromEntity(ShippimgAddressEntity entity) =>
      ShippingAddressModel(
        name: entity.name,
        address: entity.address,
        city: entity.city,
        email: entity.email,
        phone: entity.phone,
        addressDescription: entity.addressDescription,
      );

  toJson() => {
    "name": name,
    "address": address,
    "city": city,
    "email": email,
    "phone": phone,
    "addressDescription": addressDescription,
  };
}
