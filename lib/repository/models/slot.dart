class Slot {
  int? id;
  String? name;
  String? slotStart;
  String? slotEnd;
  int? status;

  Slot({this.id, this.name, this.slotStart, this.slotEnd, this.status});

  Slot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slotStart = json['slotStart'];
    slotEnd = json['slotEnd'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slotStart'] = this.slotStart;
    data['slotEnd'] = this.slotEnd;
    data['status'] = this.status;
    return data;
  }
}