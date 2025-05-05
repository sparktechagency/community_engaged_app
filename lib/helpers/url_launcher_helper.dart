import 'package:url_launcher/url_launcher.dart';

makingPhoneCall(String number) async {
  var _url = Uri.parse("tel:$number");
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}
makingEmailCall(String email) async {
  var _url = Uri.parse("mailto:$email");
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}