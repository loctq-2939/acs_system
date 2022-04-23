import 'dart:ffi';

class Order {
  int? id;
  int? appointmentId;
  String? createdDate;
  double? rating;
  int? totalPrice;
  int? status;

  Order(
      {this.id,
        this.appointmentId,
        this.createdDate,
        this.rating,
        this.totalPrice,
        this.status});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    createdDate = json['created_date'];
    rating = json['rating'];
    totalPrice = json['total_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_id'] = this.appointmentId;
    data['created_date'] = this.createdDate;
    data['rating'] = this.rating;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    return data;
  }
}
