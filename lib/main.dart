import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'providers/movies_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AppState());
}

final navigatorKey = GlobalKey<NavigatorState>();

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Peliculas App',
        routes: {
          'login': (context) => const LoginScreen(),
          'home': (context) => const HomeScreen(),
          'details': (context) => const DetailsScreen(),
        },
        theme: ThemeData.light()
            .copyWith(appBarTheme: const AppBarTheme(color: Colors.amber)),
        home: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Peliculas',
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: 'login',
    //   routes: {
    //     'login': (context) => const LoginScreen(),
    //     'home': (context) => const HomeScreen(),
    //     'details': (context) => const DetailsScreen(),
    //   },
    //   theme: ThemeData.light()
    //       .copyWith(appBarTheme: const AppBarTheme(color: Colors.amber)),
    // );
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
