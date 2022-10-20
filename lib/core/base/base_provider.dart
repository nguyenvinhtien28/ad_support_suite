import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  // final config = Get.find<EnvConfiguration>();

  @override
  void onInit() {
    // httpClient
    //   ..baseUrl = config.value[GraphQLAuthUrl]
    //   ..addAuthenticator(authInterceptor)
    //   ..addRequestModifier(requestInterceptor);
  }
}
