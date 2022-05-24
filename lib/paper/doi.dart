import 'package:url_launcher/url_launcher.dart';
import 'package:zotero_app/library/Paper.dart';

launchURLdoi(Paper paper) async {
  String doi = paper.doi ?? "/";
  var url = Uri.parse("https://www.doi.org/" + doi);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
