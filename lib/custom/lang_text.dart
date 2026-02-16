
import 'package:flutter/cupertino.dart';
import 'package:active_ecommerce_flutter/l10n/app_localizations.dart';

class LangText{

  BuildContext context;
late  AppLocalizations local;

  LangText(this.context){
   local= AppLocalizations.of(context)!;
  }
}