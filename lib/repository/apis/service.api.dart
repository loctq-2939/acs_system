

import '../response/base.response.dart';
import 'base_connect.api.dart';

class ServiceApi extends BaseConnect {

  Future<BaseResponse?> getServices() async {
    return await getResponse('/service-type/all');
  }

  Future<BaseResponse?> getCities() async {
    return await getResponse('/city/all');
  }

  Future<BaseResponse?> getDistrictByCity({required int cityId}) async {
    return await getResponse('/district/$cityId');
  }

  Future<BaseResponse?> getWardByDistrict({required int districtId}) async {
    return await getResponse('/ward/$districtId');
  }

  Future<BaseResponse?> createAppointment(Map<String, dynamic> map) async {
    return await postRequest('/appointment/createAppointment', query: map);
  }

  Future<BaseResponse?> getAppointmentByCusId({required int customer}) async {
    return await getResponse('/appointment/$customer/customer');
  }

  Future<BaseResponse?> cancelAppointment({required int id}) async {
    return await pathRequest('/appointment/cancel/$id');
  }

  Future<BaseResponse?> availableSlot(Map<String, dynamic> map) async {
    return await getResponse('/slot/available', query: map);
  }

  Future<BaseResponse?> getOrderByAppointmentId({required int appointmentId}) async {
    return await getResponse('/order/$appointmentId/appointment');
  }

  Future<BaseResponse?> getOrderDetailsByOrderId({required int orderId}) async {
    return await getResponse('/orderDetail/$orderId/manager');
  }

  Future<BaseResponse?> acceptOrderDetail({required int id}) async {
    return await pathRequest('/orderDetail/accept/$id');
  }

  Future<BaseResponse?> denyOrderDetail({required int id}) async {
    return await pathRequest('/orderDetail/deny/$id');
  }

  Future<BaseResponse?> getCompletedOrderByCusId({required int cusID}) async {
    return await getResponse('/order/$cusID/completed');
  }

}

