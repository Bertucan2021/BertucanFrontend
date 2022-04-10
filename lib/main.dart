
import 'package:bertucanfrontend/Widgets/SRH/srh_page.dart';
import 'package:bertucanfrontend/Widgets/articles/articles.dart';
import 'package:bertucanfrontend/Widgets/homepage/homepage.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_page.dart';
import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Local_database/sqlite.dart';
import 'package:bertucanfrontend/Repositories/user_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/srh_item.dart';
import 'package:bertucanfrontend/Widgets/onBoaringQuetinary/ui/on_boarding.dart';
import 'package:bertucanfrontend/Widgets/profile/profile.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_bloc.dart';
import 'package:bertucanfrontend/bloc/user/register/resgister_bloc.dart';
import 'package:bertucanfrontend/providers/user_data_provider.dart';
import 'package:bertucanfrontend/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await test();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({Key? key}) : super(key: key);
  final UserRepository userRepository = UserRepository(userDataProvider: UserDataProvider(httpClient: http.Client()));


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CycleBloc(),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(userRepository: userRepository),
        )
      ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.pink, fontFamily: 'Poppins Medium'),
      onGenerateRoute: PageRouter.generateRoute,

      initialRoute: Questionnaire.routeName,
    ));
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
    SRHPage(),
    const ProfilePage(),
    GBVPage(),
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


