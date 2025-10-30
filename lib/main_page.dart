import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/features/analytics/pages/analytics_page.dart';
import 'package:todo_app/features/tasks/view/tasks_page.dart';
import 'package:todo_app/features/timer/pages/timer_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // hangi sekmenin seçili olduğunu tutacak olan index
  int _selectedIndex = 0;

  // navigation barda gösterilecek sayfalar
  static const List<Widget> _pages = <Widget>[
    TasksPage(),
    TimerPage(),
    AnalyticsPage(),
  ];

  // Sekmeye tıklandığında çağıracağımız fonksiyon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Görevler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Zamanlayıcı',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analiz',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary, // Seçili ikon ve yazı rengi
        unselectedItemColor: Colors.grey, // Seçili olmayan ikon ve yazı rengi
        onTap: _onItemTapped,
      ),
    );
  }
}
