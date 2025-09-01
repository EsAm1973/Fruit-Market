class ShippimgAddressEntity {
  String? name;
  String? address;
  String? city;
  String? email;
  String? phone;
  String? addressDescription;

  ShippimgAddressEntity({
    this.name,
    this.address,
    this.city,
    this.email,
    this.phone,
    this.addressDescription,
  });

  bool isValid() {
    return addressDescription != null &&
        addressDescription!.isNotEmpty &&
        city != null &&
        city!.isNotEmpty;
  }
}
