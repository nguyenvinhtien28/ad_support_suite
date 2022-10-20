part of '../app_utils.dart';

enum ConfirmAction { CANCEL, ACCEPT }

String numberFormat(int num) {
  final formatter = NumberFormat("#,###");
  return formatter.format(num);
}

String APP_VERSION = "1.0.0";

bool checkFormat(String regex, String checkedString) {
  return RegExp(regex).hasMatch(checkedString);
}

String formatNameByCurrentTime(String prefixWithLine) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('ddMMyyyy_HHmmss').format(now);
  return prefixWithLine + formattedDate;
}

String fullStringTimeFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('dd/MM/yyyy').format(date.toLocal()) : '';
}

String fullStringTimeFormatTimeStraps(int stringTime) {
  final date = DateTime.fromMillisecondsSinceEpoch(stringTime * 1000);
  return date != null ? DateFormat('dd/MM/yyyy').format(date.toLocal()) : '';
}

String formatDateVBNB(String? dateString) {
  final date = DateTime.tryParse(dateString ?? "");
  return date != null ? DateFormat('dd/MM/yyyy HH:mm').format(date.toLocal()) : '';
}

String fullStringTimerTimeStraps(int stringTime) {
  final date = DateTime.fromMillisecondsSinceEpoch(stringTime * 1000);
  return date != null ? DateFormat('HH:mm').format(date.toLocal()) : '';
}

String fullStringTimeFormatCetificate(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('dd/MM/yy').format(date.toLocal()) : '';
}

String fullStringTimerFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('HH:mm').format(date) : '';
}

String fullStringTimerFormatUTC(String? stringTime) {
  final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(stringTime ?? "", true);
  final now = DateTime.now();
  final aDate = DateTime(date.year, date.month, date.day);
  final today = DateTime(now.year, now.month, now.day);
  if (today == aDate) {
    return DateFormat('hh:mm').format(date.toLocal());
  }
  return DateFormat('dd/MM/yyyy').format(date.toLocal());
}

String fullStringClassTimerFormatUTC(int? stringTime) {
  final date = Duration(days: stringTime! * 60);
  final zero = DateTime.now();

  return DateFormat('M').format(zero.add(date).toLocal());
}

String fullStringDayTimerFormatUTC(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');

  return date != null ? DateFormat('dd').format(date.toLocal()) : "";
}

String convertStringTimeToTimeAgo(String timeStamp) {
  final date = DateTime.tryParse(timeStamp);
  final secondAgo = date?.subtract(const Duration(milliseconds: 0));
  final time = timeago.format(secondAgo ?? DateTime.now(), locale: 'en_short');
  return time == "now" ? "Vừa xong" : "$time trước";
}

String fullStringMonthYearTimerFormatUTC(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');

  return date != null ? "tháng ${DateFormat('MM, yyyy').format(date.toLocal())}" : "";
}

String fullStringTimerFormatUTCCetificate(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? "");

  return date != null ? DateFormat('hh:mm').format(date.toLocal()) : '';
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

bool checkValidLocalPath(String path) {
  if (path == null) return true;
  if (path.contains("http") || path.contains("https")) return false;

  return true;
}

String fullStringTimerAMPMFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  var dateParse;
  if (date != null) {
    dateParse = DateTime(date.year, date.month, date.day, date.hour + 7, date.minute);
  }
  return dateParse != null ? DateFormat('hh:mm a').format(dateParse) : "";
}

String fullStringDateTimerFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? "${DateFormat('hh:mm').format(date.toLocal())} ngày ${fullStringTimeFormat(stringTime)}" : '';
}

String fullStringDateTimerFormat2(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('hh:mm:ss').format(date) : '';
}

void showLog(String text) {
  Logger().d(text);
}


String fullStringDateTimerAllTimeStamp(String? stringTime) {
  final dateTimeStamp = DateTime.fromMillisecondsSinceEpoch(int.parse(stringTime ?? "0") * 1000);
  // final date = DateTime.tryParse(stringTime ?? '');
  return dateTimeStamp != null ? DateFormat('dd-MM-yyyy - HH:mm:ss').format(dateTimeStamp.toLocal()) : '';
}

String fullStringDateTimerFormatLearn(String? stringTime) {
  if (Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60) == 0) {
    return "${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} giờ ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} phút ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} giây";
  }
  return "${Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60)} ngày ${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} giờ ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} phút ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} giây";
}

String fullStringDateTimerFormatExam(String? stringTime) {
  return "${Duration(milliseconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} : ${Duration(milliseconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} : ${Duration(milliseconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} s";

  // return "${Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60)} ngày ${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} s";
}

String fullStringDateTimerFormatExamRs(String? stringTime) {
  final duration = Duration(milliseconds: int.parse(stringTime ?? "0"));
  return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

  // return "${Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60)} ngày ${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} s";
}

String fullStringDateTimerFormatExamRsmin(String? stringTime) {
  final duration = Duration(minutes: int.parse(stringTime ?? "0"));
  return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

  // return "${Duration(seconds: int.parse(stringTime ?? "0")).inDays.remainder(60)} ngày ${Duration(seconds: int.parse(stringTime ?? "0")).inHours.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inMinutes.remainder(60)} : ${Duration(seconds: int.parse(stringTime ?? "0")).inSeconds.remainder(60)} s";
}

String fullStringDateTimerCommentFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? "${fullStringTimeFormat(stringTime)} - ${DateFormat('kk:mm').format(date.toLocal())}" : '';
}

bool checkPassLength(String passWord) {
  if (passWord.length >= 8) {
    return false;
  } else {
    return true;
  }
}

var formatter = NumberFormat("#,##0.00", "en_US");

List splitName(String fullName) {
  var names = fullName.trim().split(" ");
  if (names.isEmpty) {
    return ["", ""];
  }

  if (names.length == 1) {
    return [names[0], ""];
  }

  return [names[0], names.skip(1).join(' ')];
}

Future<Future<ConfirmAction?>> asyncConfirmDialog(BuildContext context, String title, String message) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Hủy'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          TextButton(
            child: const Text('Đồng ý'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

Future<String> saveFile(io.File _file, String _fileName) async {
  String directory = (await getApplicationDocumentsDirectory()).path;
  String path = directory + "/" + "PSHN_User";
  // copy the file to a new path
  String fileFullPath = '$path/$_fileName';
  final io.File newFile = await _file.copy(fileFullPath);
//    final io.File newImage = await _file.copy(fileFullPath);
//    io.File file = new io.File(fileFullPath);
//    await file.writeAsBytes(_file.readAsBytesSync());
  if ((await newFile.exists()) == true && (await newFile.length()) > 0) {
    print("File $_fileName saved to new path: $fileFullPath");
    String newFilePath = newFile.path;
    print("File $_fileName get path: $newFilePath");
  } else {
    print("File $_fileName DON'T saved to new path: $fileFullPath");
  }
  return fileFullPath;
}

Future<void> createAppFolder() async {
  try {
    //create Variable
    String directory = (await getApplicationDocumentsDirectory()).path;
    String appDirectory = directory + "/" + "PSHN_User";
    if (await io.Directory(appDirectory).exists() != true) {
      print("Directory $appDirectory not exist");
      io.Directory(appDirectory).createSync(recursive: true);
      //do your work
    } else {
      print("Directory $appDirectory exist");

      //Trong trường hợp không phải là edit article ==> nếu queue upload rỗng thì sẽ xóa tất cả các file thừa cho khỏi nặng máy
      final myDir = io.Directory(appDirectory);
      List<io.FileSystemEntity> _images;
      _images = myDir.listSync(recursive: true, followLinks: false);
    }
  } catch (ex) {
    print(ex.toString());
  }
}

errorToast({String msg = ""}) {
  Fluttertoast.showToast(
      msg: msg == "" ? "Lỗi không xác định" : msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: colorBlack,
      textColor: Colors.white,
      fontSize: 16.0);
}

successToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: colorBlack,
      textColor: Colors.white,
      fontSize: 16.0);
}
