import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_paper_main/app_constant/appconstant.dart';
import 'package:wallet_paper_main/page/tabbar.dart';
import 'package:wallet_paper_main/provider/data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConstant.enlocale,
        AppConstant.zhlocale
      ], 
      fallbackLocale: AppConstant.zhlocale,
      path: AppConstant.langpath,
      child: ChangeNotifierProvider(
        create: (_) => DataProvider(),
        child: const MyApp(),
      ))
  );

}
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
   Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: MyTabbar(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
   }
}


