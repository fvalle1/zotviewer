import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
import 'package:zotero_app/main.dart';
import 'package:liquid_glass_ui_design/liquid_glass_ui.dart';

import '../l10n/app_localizations.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authUrl = getAuthUrl();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
              Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: LiquidContainer(
              borderRadius: 24,
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.login,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: authorize,
                    child: FutureBuilder(
                        future: authUrl,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          if (snapshot.hasData) {
                            return LiquidButton(
                              onTap: authorize,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Text(
                                  'Authorize on Zotero',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                  SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.loginCopy,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  LiquidContainer(
                    borderRadius: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: TextField(
                      onSubmitted: (String token) {
                        login(token).then((val) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage())));
                      },
                      obscureText: false,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Token',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
