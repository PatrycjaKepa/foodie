import 'package:foodie/routes/main_screen.dart';
import 'package:foodie/views/home.dart';
import 'package:foodie/views/login.dart';
import 'package:foodie/views/registration.dart';
import 'package:foodie/views/remind_yourself.dart';
import 'package:foodie/views/start_screen.dart';
import 'package:go_router/go_router.dart';

 final router = 
  GoRouter(
    initialLocation: '/start',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {return HomePage();
        }),
      GoRoute(
        path: '/start',
        name: 'start',
        builder: (context, state) => const StartScreen()
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage()
      ),
      GoRoute(
        path: '/registration',
        name: 'registration',
        builder: (context, state) => const RegistrationPage()
      ),
      GoRoute(
        path: '/mainscreen',
        name: 'mainscreen',
        builder: (context, state) => MainScreen()
      ),
      GoRoute(
        path: '/remindYourself',
        name: 'remindYourself',
        builder: (context, state) => RemindYourself()
      ),
    ],
  );