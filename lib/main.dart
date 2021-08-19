import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:refactory_test/constant.dart';
import 'package:refactory_test/provider/signin_provider.dart';
import 'package:refactory_test/ui/condition_page.dart';
import 'package:refactory_test/ui/homepage/home_page.dart';
import 'package:refactory_test/ui/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SigninProvider(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ConditionPage(),
      ),
    );
  }
}
