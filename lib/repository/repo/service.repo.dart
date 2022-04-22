import 'package:acs_1/repository/apis/service.api.dart';
import 'package:acs_1/repository/models/appointment.dart';
import 'package:acs_1/repository/models/distric.dart';
import 'package:acs_1/repository/models/slot.dart';
import 'package:acs_1/repository/models/ward.dart';
import '../models/city.dart';
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
}
