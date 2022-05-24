import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:package_info/package_info.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoPage extends StatelessWidget {
  void launchGitUrl() async {
    var url = Uri.parse("https://bitbucket.org/fvalle01/zotviewer/src/main/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1),
        Image(
          image: NetworkImage(
              "https://bitbucket.org/fvalle01/zotviewer/raw/081f6772e98137532eb8fb15c5148f39ce279a69/logo.png"),
          errorBuilder: (context, obj, st) => Container(),
        ),
        // FutureBuilder<PackageInfo>(
        //   future: PackageInfo.fromPlatform(),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.done:
        //         return Text("v " + snapshot.data!.version,
        //             style: TextStyle(fontSize: 25));
        //       default:
        //         return const Text("v 1.0.0^");
        //     }
        //   },
        // ),
        Text("v 1.5.0", style: TextStyle(fontSize: 25)),
        Text(AppLocalizations.of(context)!.by("Filippo Valle"),
            style: TextStyle(fontSize: 25)),
        Spacer(flex: 2),
        Text(AppLocalizations.of(context)!.openSource,
            style: TextStyle(fontSize: 20)),
        GestureDetector(
          onTap: launchGitUrl,
          child: Text(
            "https://bitbucket.org/fvalle01/zotviewer/",
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        Text(AppLocalizations.of(context)!.released("GPL v3"),
            style: TextStyle(fontSize: 18)),
        Spacer(flex: 1)
      ],
    )));
  }
}
