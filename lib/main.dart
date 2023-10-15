import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_adityapratama/pages/login.dart';
import 'package:sims_ppob_adityapratama/provider/home_notifier.dart';
import 'package:sims_ppob_adityapratama/provider/register_notifier.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/widget/bottombar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget home = const LoginPage();
  if (prefs.getString('token')?.isNotEmpty ?? false) {
    home = const BottomNavBar();
  } else {
    home = const LoginPage();
  }
  runApp(MyApp(
    home: home,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.home});

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ApiNotifier>(create: (_) => ApiNotifier()),
      ChangeNotifierProvider<RegisterNotifier>(
          create: (_) => RegisterNotifier(apiNotifier: ApiNotifier())),
      ChangeNotifierProvider<HomeNotifier>(
          create: (_) => HomeNotifier(apiNotifier: ApiNotifier()))

    ], child: MaterialApp(home: home));
  }
}
