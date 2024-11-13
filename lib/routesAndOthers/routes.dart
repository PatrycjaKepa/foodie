import 'package:foodie/cookBookPage/addRecipe/add_recipe.dart';
import 'package:foodie/routesAndOthers/bottomBar.dart';
import 'package:foodie/cookBookPage/cook_book.dart';
import 'package:foodie/views/home.dart';
import 'package:foodie/user/login.dart';
import 'package:foodie/user/registration.dart';
import 'package:foodie/user/remind_yourself.dart';
import 'package:foodie/views/start_screen.dart';
import 'package:go_router/go_router.dart';

 final router = 
  GoRouter(
    initialLocation: '/start',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {return const HomePage();
        }),
      GoRoute(
        path: '/start',
        name: 'start',
        builder: (context, state) => StartScreen()
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
        path: '/bottomBar',
        name: 'bottomBar',
        builder: (context, state) => const BottomBar()
      ),
      GoRoute(
        path: '/remindYourself',
        name: 'remindYourself',
        builder: (context, state) => const RemindYourself()
      ),
      GoRoute(
        path: '/addRecipe',
        name: 'addRecipe',
        builder: (context, state) => AddRecipe()
      ),
      GoRoute(
        path: '/cookBookPage',
        name: 'cookBookPage',
        builder: (context, state) => CookBookPage()
      ),
    ],
  );