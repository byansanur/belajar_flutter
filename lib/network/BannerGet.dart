import 'dart:convert';

import 'package:http/http.dart' as http;

// object
class BannerGet {
  final String name;
  final int idBanner;
  final String photo;

  BannerGet({this.name, this.idBanner, this.photo});

  factory BannerGet.createUser(Map<String, dynamic> object) {
    return BannerGet(name: object['nama'], idBanner: object['id'], photo: object['foto']);
  }

  static Future<List<BannerGet>> getBanners() async {
    int limit = 2;
    String baseUrl = "http://202.180.19.163:81/api/master/v3/mst_banner?limit="+limit.toString();
    String photoUrl = "http://202.180.19.163:81/service/image/";
    String photoThumbUrl = "http://202.180.19.163:81/service/image_thumb/";

    var apiResult = await http.get(baseUrl);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listBanner = (jsonObject as Map<String, dynamic>)['data'];

    List<BannerGet> banner = [];
    for(int i = 0; i < listBanner.length; i++) {
      banner.add(BannerGet.createUser(listBanner[i]));
    }
    return banner;
  }
}