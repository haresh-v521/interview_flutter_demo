import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Functions {
  static String getShortName({String firstName, String lastName}) {
    String fName = firstName != null && firstName.length != 0 ? firstName[0] : "";
    String lName = lastName != null && lastName.length != 0 ? lastName[0] : "";

    return "$fName$lName";
  }

  static String getDay(String date) {
    DateTime day = DateFormat('yyyy-MM-dd').parse(date);
    return DateFormat('EEE').format(day);
  }

  static String getMonth(String date) {
    DateTime month = DateFormat('yyyy-MM-dd').parse(date);
    return DateFormat('MMM').format(month);
  }

  static String getDate(String date) {
    DateTime d = DateFormat('yyyy-MM-dd').parse(date);
    return DateFormat('d').format(d);
  }

  static String getYear(String date) {
    DateTime year = DateFormat('yyyy-MM-dd').parse(date);
    return DateFormat('yyyy').format(year);
  }

  static void ShowToast(String msg, {FToast fToast, Color bgColor = Colors.white, Color txtColor = Colors.black, int durationInSec = 6}) {
    if (fToast != null) {
      _showToast(msg: msg, fToast: fToast, durationInSec: durationInSec, bgColor: bgColor, txtColor: txtColor);
    } else {
      Fluttertoast.showToast(msg: msg, backgroundColor: bgColor, textColor: txtColor);
    }
  }

  static _showToast({String msg, FToast fToast, Color bgColor = Colors.white, Color txtColor = Colors.black, int durationInSec}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: txtColor,
            ),
          )),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: durationInSec),
    );
  }

  static dynamic testJwtToken(String token) {
    if (token == null)
      return "Token is null.";
    else {
      var data = parseJwt(token);
      if (data == null)
        return "Token is wrong";
      else {
        return data;
      }
    }
  }

  static dynamic parseJwt(String token) {
    if (token == null || token.isEmpty) return 'null token';

    final parts = token.split('.');
    if (parts.length != 3) {
      return 'invalid token';
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      return 'invalid payload';
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static Future<Uint8List> readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File audioFile = File.fromUri(myUri);
    Uint8List bytes;
    await audioFile.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
      print('reading of bytes is completed');
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' + onError.toString());
    });
    return bytes;
  }


  static Future<String> getFleStorePath() async {

    Directory tempDir = await getTemporaryDirectory();
    String customPath = tempDir.path;
    print("-----customPath------- tempPath >  $customPath");
    /* Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  print("-----textToAudio------- appDocPath >  $appDocPath");*/
    return customPath;
  }


}
