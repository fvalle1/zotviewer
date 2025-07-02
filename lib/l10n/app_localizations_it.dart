// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get collection => 'Collezione';

  @override
  String get collections => 'Collezioni';

  @override
  String get errorNoName => 'Errore';

  @override
  String get open => 'apri';

  @override
  String get login => 'Per entrare apri il seguente link';

  @override
  String get loginCopy => 'Poi copia il codice nello spazio qui sotto';

  @override
  String get openSource => 'Questo è un progetto open source';

  @override
  String released(String license) {
    return 'Rilasciato con licenza $license';
  }

  @override
  String by(String name) {
    return 'creato da $name';
  }

  @override
  String get settings => 'impostazioni';

  @override
  String get forgot => 'Log Out';

  @override
  String get loading => 'Caricamento...';

  @override
  String get itis => 'È';

  @override
  String get itisnot => 'Non è';

  @override
  String nCit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citazioni',
      one: 'una citazione',
      zero: 'nessuna citazione',
    );
    return '$_temp0';
  }

  @override
  String get influential => 'influenti';

  @override
  String nInfluentialCit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citazioni influenti',
      one: 'una citazione influente',
      zero: 'nessuna citazione influente',
    );
    return '$_temp0';
  }

  @override
  String get share => 'Condividi';

  @override
  String get export => 'Esporta';

  @override
  String get licences => 'Licenze';
}
