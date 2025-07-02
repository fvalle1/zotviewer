// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get collection => 'Collection';

  @override
  String get collections => 'Collections';

  @override
  String get errorNoName => 'No name';

  @override
  String get open => 'open';

  @override
  String get login => 'In order to login go to the following address';

  @override
  String get loginCopy =>
      'Then copy here the authorisation code in the space below';

  @override
  String get openSource => 'This is an open source project';

  @override
  String released(String license) {
    return 'Released under $license';
  }

  @override
  String by(String name) {
    return 'by $name';
  }

  @override
  String get settings => 'Settings';

  @override
  String get forgot => 'Log Out';

  @override
  String get loading => 'Loading...';

  @override
  String get itis => 'It\'s';

  @override
  String get itisnot => 'It is not';

  @override
  String nCit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citations',
      one: 'one citation',
      zero: 'no citations',
    );
    return '$_temp0';
  }

  @override
  String get influential => 'influential';

  @override
  String nInfluentialCit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count influential citations',
      one: 'one influential citation',
      zero: 'no influential citations',
    );
    return '$_temp0';
  }

  @override
  String get share => 'Share';

  @override
  String get export => 'Export';

  @override
  String get licences => 'Licences';
}
