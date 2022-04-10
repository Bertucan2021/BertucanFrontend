import 'package:bertucanfrontend/Data/gbv_centers.dart';
import 'package:bertucanfrontend/Service/http_calls.dart';

class GBVRepository {
  final HttpCalls _httpCalls = HttpCalls();
  Future<List<GBVCentersData>> getGBVCenters() => _httpCalls.getGBVCenters();
  Future<GBVCentersData> getGBVCenterDetail(int id) =>
      _httpCalls.getGBVCenterDetail(id);
}
