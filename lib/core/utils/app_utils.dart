///
/// A collection of useful functions
///
library utils;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

import '../../theme/app_theme.dart';


part 'debouncer.dart';
part 'convert_number.dart';
part 'extensions/date_time.dart';
part 'responsive/responsive.dart';
part 'responsive/app_responsive.dart';