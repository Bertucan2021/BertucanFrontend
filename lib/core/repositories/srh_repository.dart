import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';

import '../adapters/srh_adapter.dart';

class SrhRepository implements ISrhRepository {
  ApiClient apiClient;
  SrhRepository({required this.apiClient});

  @override
  Future<List<Srh>> getSrhs() async {
    var response = await apiClient.request(
        requestType: RequestType.get,
        path: "/articles",
        data: {'language': 'english'});
    List<Srh> temp = [];
    response["data"].forEach((data) {
      temp.add(Srh.fromJson(data));
    });
    return temp;
  }
}
