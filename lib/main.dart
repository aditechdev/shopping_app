import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constants/global_variable.dart';
import 'package:shopping_app/features/auth/screens/auth_screens.dart';
import 'package:shopping_app/features/auth/services/auth_service.dart';
import 'package:shopping_app/features/home/screens/home_screens.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:shopping_app/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
     auth.getUserData(context: context);
  }
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
     
    
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Shopping App Clone ',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariable.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const AuthScreen(),
    );
  }
}
