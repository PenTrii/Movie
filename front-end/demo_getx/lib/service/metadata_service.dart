import 'dart:convert';

import 'package:demo_getx/models/metadata.dart';
import 'package:demo_getx/service/remote_service.dart';

class MetadataService {

  static Future<Metadata> getMetadata() async {
    final String uri = "metadata";

    try {
      var response = await RemoteService().get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)["data"];
        return Metadata.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}