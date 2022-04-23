import 'package:acs_1/repository/apis/service.api.dart';
import 'package:acs_1/repository/models/appointment.dart';
import 'package:acs_1/repository/models/distric.dart';
import 'package:acs_1/repository/models/order_history.dart';
import 'package:acs_1/repository/models/slot.dart';
import 'package:acs_1/repository/models/ward.dart';
import '../models/city.dart';
import '../models/order.dart';
import '../models/order_detail_.dart';
import '../models/service.dart';

class ServiceRepo {
  final ServiceApi serviceApi;

  ServiceRepo(this.serviceApi);

  Future<List<Service>?> getService() async {
    var res = await serviceApi.getServices();
    return res?.success == true
        ? List.from(res?.data).map((e) => Service.fromJson(e)).toList()
        : null;
  }

  Future<List<City>?> getCity() async {
    var res = await serviceApi.getCities();
    return res?.success == true
        ? List.from(res?.data).map((e) => City.fromJson(e)).toList()
        : null;
  }

  Future<List<District>?> getDistrictByCity({required int cityId}) async {
    var res = await serviceApi.getDistrictByCity(cityId: cityId);
    return res?.success == true
        ? List.from(res?.data).map((e) => District.fromJson(e)).toList()
        : null;
  }

  Future<List<Ward>?> getWardByDistrict({required int districtId}) async {
    var res = await serviceApi.getWardByDistrict(districtId: districtId);
    return res?.success == true
        ? List.from(res?.data).map((e) => Ward.fromJson(e)).toList()
        : null;
  }

  Future<bool> createAppointment({required Appointment appointment}) async {
    var res = await serviceApi.createAppointment(appointment.toQuery());
    return res?.success ?? false;
  }

  Future<List<Appointment>?> getAppointmentByCusId({required int customer}) async {
    var res = await serviceApi.getAppointmentByCusId(customer: customer);
    return res?.success == true
        ? List.from(res?.data).map((e) => Appointment.fromJson(e)).toList()
        : null;
  }

  Future<bool> cancelAppointment({required int id}) async {
    var res = await serviceApi.cancelAppointment(id: id);
    return res?.success ?? false;
  }

  Future<List<Slot>?> getAvailableSlot(Map<String, dynamic> map) async {
    var res = await serviceApi.availableSlot(map);
    return res?.success == true ? List.from(res?.data).map((e) => Slot.fromJson(e)).toList() : null;
  }

  Future<Order?> getOrderByAppointmentId({required int appointmentId}) async {
    var res = await serviceApi.getOrderByAppointmentId(appointmentId: appointmentId);
    return res?.success == true ? Order.fromJson(res?.data) : null;
  }

  Future<List<OrderDetailX>?> getOrderDetailsByOrderId({required int orderId}) async {
    var res = await serviceApi.getOrderDetailsByOrderId(orderId: orderId);
    return res?.success == true ? List.from(res?.data).map((e)=> OrderDetailX.fromJson(e)).toList() : null;
  }

  Future<bool> acceptOrderDetail({required int id}) async {
    var res = await serviceApi.acceptOrderDetail(id: id);
    return res?.success ?? false;
  }

  Future<bool> denyOrderDetail({required int id}) async {
    var res = await serviceApi.denyOrderDetail(id: id);
    return res?.success ?? false;
  }

  Future<List<OrderHistory>?> getCompletedOrderByCusId({required int customer}) async {
    var res = await serviceApi.getCompletedOrderByCusId(cusID: customer);
    return res?.success == true
        ? List.from(res?.data).map((e) => OrderHistory.fromJson(e)).toList()
        : null;
  }
}
