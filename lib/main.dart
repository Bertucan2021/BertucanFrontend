import 'package:bertucanfrontend/Widgets/SRH/srh_page.dart';
import 'package:bertucanfrontend/Widgets/homepage/homepage.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_page.dart';
import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/profile/profile.dart';
import 'package:bertucanfrontend/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.pink, fontFamily: 'Poppins Medium'),
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: LoginPage.pageRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final screens = [
    const HomePage(),
    const SRHPage(),
    const ProfilePage(),
    const GBVPage(),
  ];
  int currentIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: screens[currentIndex],
        bucket: _bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFFFEEFF2),
        elevation: 0.0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        enableFeedback: true,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dock), label: 'SRH'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'GBV')
        ],
      ),
    );
  }
}
