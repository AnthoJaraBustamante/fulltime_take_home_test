import 'package:fulltime_take_home_test/app/data/models/api_responde.dart';
import 'package:fulltime_take_home_test/app/data/providers/commits_api.dart';
import 'package:get_it/get_it.dart';

class CommitsService {
  final CommitsApi _api = GetIt.instance<CommitsApi>();

  Future<ApiResponse> getService() async => _api.getApi();
}
