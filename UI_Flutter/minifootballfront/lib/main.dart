import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/auth_screen.dart';
import 'package:minifootballfront/screen/wrapper.dart';
import 'package:minifootballfront/service/tokenservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minifootball App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: FutureBuilder<Widget>(
        future: getInitialScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? AuthScreen();
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Future<Widget> getInitialScreen() async {
    String? token = await TokenService().getToken();
    if (token != null) {
      return Wrapper();
    }
    return AuthScreen();
  }
}
