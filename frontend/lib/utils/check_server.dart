import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:pocketbase/pocketbase.dart';
import '../provider/pocketbase_provider.dart';

Future<bool> isServerRunningUtil() async {
  bool serverIsRunning = false;
  var url = Uri.http('', '/api/health');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse['code'] == 200 &&
          jsonResponse['message'] == 'API is healthy.') {
        serverIsRunning = true;
      }
    }
  } on SocketException /* catch (error) */ {
    serverIsRunning = false;
  }

  return serverIsRunning;
}
