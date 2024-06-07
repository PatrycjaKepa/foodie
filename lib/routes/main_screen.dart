import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/routes/provider.dart';
import 'package:foodie/views/cook_book.dart';
import 'package:foodie/views/home.dart';
import 'package:foodie/views/login.dart';
import 'package:foodie/views/shopping_list.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen ({super.key});

  @override
  Widget build (BuildContext context, WidgetRef ref) {
    final bodies = [
      const Center(
        child: HomePage(),
      ),
      const Center(
        child: CookBookPage(),
      ),
      const Center(
        child: ShoppingList(),
      ),
    ];

    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavbar,
          onTap: (value) {
            ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: 'Przepisy'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Zakupy'),
          ],
        ),
        body: bodies[indexBottomNavbar],
    );
  }
  }