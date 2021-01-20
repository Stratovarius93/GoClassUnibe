//https://script.google.com/macros/s/AKfycbz2NMoIqTA3pKd9vciEJge1vI6kYmFLDM2qHePwYHUw3Fo7xC4/exec
//https://script.google.com/macros/s/AKfycbyJP_gDxTIrmKvDDzmxpG-3iPGRFBwbiiYf4Pax/exec
import 'package:http/http.dart' as http;

class GSheetsRequest {
  String url =
      //"https://script.google.com/macros/s/AKfycbyJP_gDxTIrmKvDDzmxpG-3iPGRFBwbiiYf4Pax/exec";
      "https://script.google.com/macros/s/AKfycbz2NMoIqTA3pKd9vciEJge1vI6kYmFLDM2qHePwYHUw3Fo7xC4/exec";
  GSheetsRequest();

  Future<http.Response> fetchSchedule() {
    return http.get(url);
  }
}
