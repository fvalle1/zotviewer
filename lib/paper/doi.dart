import 'package:url_launcher/url_launcher.dart';
import 'package:zotero_app/library/Paper.dart';

launchURLdoi(Paper paper) async {
  String doi = paper.doi ?? "/";
  var url = Uri.parse("https://doi.org/" + doi);
  try {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    throw 'Could not launch $url: $e';
  }
}
