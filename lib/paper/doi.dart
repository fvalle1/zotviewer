import 'package:url_launcher/url_launcher.dart';
import 'package:zotero_app/library/Paper.dart';

launchURLdoi(Paper paper) async {
  String doi = paper.doi ?? "/";
  var url = "https://www.doi.org/" + doi;
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
