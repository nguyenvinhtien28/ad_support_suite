import 'package:get/get.dart';

class BaseController extends GetxController {
  // final _networkController = Get.find<NetworkController>();
  // final sicixUIRepository = Get.find<SicixUIRepository>();
  // final storage = Get.find<UserService>();

  // final firebaseMessageConfig = FirebaseMessageConfig();

  var _hasNetwork = true;

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    // await checkConnectNetwork();

    // await firebaseMessageConfig.handleMessage();
  }

  // Future<void> checkConnectNetwork() async {
  //   // Check Network
  //   if (_networkController.connectionStatus.value == 0) {
  //     _hasNetwork = false;
  //     appSnackbar("Không có kết nối internet", type: SnackbarType.error);
  //   }
  //   _networkController.connectionStatus.listen((status) {
  //     printInfo(info: 'connectionStatus listen $status');
  //     if (status == 0) {
  //       _hasNetwork = false;
  //       appSnackbar("Không có kết nối internet", type: SnackbarType.error);
  //     } else {
  //       _hasNetwork = true;
  //     }
  //   });
  // }

  // CommonDialogRequest handleErrorResponse(Object e) {
  //   return handleErrorGraphQLResponse(e);
  // }
}
