import 'package:bertucanfrontend/core/models/freezed_models.dart';

abstract class IGbvRepository {
  Future<List<Gbv>?> getGbvies();
}
