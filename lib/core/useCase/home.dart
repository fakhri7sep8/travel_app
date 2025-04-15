import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/model/model.dart';

class homeController {
  var url = dotenv.env['baseUrl'];

  Future getCategory() async {
    Uri urlCategories = Uri.parse("$url/categories");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login? dataUser = loginFromJson(prefs.getString('login')!);
    String token = "Bearer " + dataUser.token;
    var response = await http.get(urlCategories, headers: {
      'Authorization': token,
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<Categories> data = categoriesFromJson(response.body);
      return data;
    } else {
      return null;
    }
  }

  Future getWisata() async {
    try {
      Uri urlWisata = Uri.parse("$url/wisata");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login? dataUser = loginFromJson(prefs.getString('login')!);
      String token = "Bearer " + dataUser.token;
      var response = await http.get(urlWisata, headers: {
        "Authorization": token,
        "Content-Type": "application/json"
      });
      if (response.statusCode == 200) {
        print("==========================");
        DataWisata data = DataWisataFromJson(response.body);
        print("===========================");
        List<DetailWisata> favorit = data.data;
        favorit = favorit.where((x) => x.isFav == 1).toList();
        return [
          {"favorit": favorit, "populer": data.data}
        ];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
