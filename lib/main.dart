// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/repository/booking_repository.dart';
import 'package:ryt_life_cs/bloc/repository/create_user.dart';
import 'package:ryt_life_cs/bloc/repository/notification_repository.dart';
import 'package:ryt_life_cs/bloc/repository/theripiest.dart';
import 'package:ryt_life_cs/utils/firebase_options.dart';
import 'package:ryt_life_cs/screens/mainScreen/onbording_page.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/app_utils.dart';
import 'package:ryt_life_cs/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/event/login_event.dart';
import 'package:ryt_life_cs/bloc/state/login_state.dart';
import 'package:ryt_life_cs/bloc/repository/login_repository.dart';
import 'package:ryt_life_cs/bloc/login_bloc.dart';
import 'package:ryt_life_cs/screens/home_screen.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // log('$error', name: 'onError:(error):');
    // log('$bloc', name: 'onError:(bloc):');
    // log('${bloc.runtimeType}', name: 'onError:(bloc.runtimeType):');
    // log('$stackTrace', name: 'onError:(stackTrace):');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // log('$transition', name: 'onTransition:');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // log('$bloc', name: 'onChange:(bloc):');
    // log('$change', name: 'onChange:(change):');
    // log('${bloc.runtimeType}', name: 'onChange:(bloc.runtimeType):');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // log('$event', name: 'onEvent:');
    super.onEvent(bloc, event);
  }
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  Preferences.prefs = await SharedPreferences.getInstance();
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await initDevFlavor();
  // await initStagFlavour();
  await initProdFlavor();

  runApp(const MyApp());
}

initDevFlavor() {
  FlavorConfig(name: "DEV", color: Colors.red, variables: {
    "version": '1.0.0',
    "baseUrl": "https://dev.api.ryt.life/v1/",
  });
}

initStagFlavour() {
  FlavorConfig(name: "STG", color: Colors.red, variables: {
    "version": '1.0.0',
    "baseUrl": "https://stg.api.ryt.life/v1/",
  });
}

initProdFlavor() {
  FlavorConfig(name: "PROD", color: Colors.red, variables: {
    "version": '1.0.0',
    "baseUrl": "https://api.ryt.life/v1/",
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  final LoginBloc loginBloc = LoginBloc(loginRepository: LoginRepository());
  String mailId = '';
  String basePath = '';

  @override
  void initState() {
    super.initState();
    token = Preferences.prefs?.getString(AppString.token) ?? '';
    // Preferences.prefs?.setString(AppString.token,
    //     'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDExNWMzOWVjNmIxM2E1ZmQ1NGQyODgiLCJpYXQiOjE2ODM3MjAwOTksImV4cCI6MTY4NjEzOTI5OX0.YRMixwZ0jKzWk5rqfIw-TF1_g6SY01ROPVkDlz1HnPU');
    checkAppVersion();
    basePath = Uri.parse(window.location.href).path;
    checkResetPassword();
  }

  void checkAppVersion() {
    String nVersion = FlavorConfig.instance.variables["version"];
    String oVersion = Preferences.prefs?.getString(AppString.appVersion) ?? '';
    if (nVersion.compareTo(oVersion) != 0) {
      Preferences.prefs?.clear();
      Preferences.prefs?.setString(AppString.appVersion, nVersion);
    }
  }

  void checkResetPassword() {
    Map queryParam = Uri.parse(window.location.href).queryParameters;
    if (queryParam.containsKey('email')) {
      if (Utils().validateEmail(queryParam['email'])) {
        mailId = queryParam['email'];
        Future.delayed(Duration.zero, () => window.history.replaceState(null, "", "/"));
        loginBloc.add(NavigateToResetPassword(mailId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => loginBloc,
        ),
        BlocProvider(
          create: (_) => DashboardBloc(
            createUserrepository: CreateUserRepository(),
            notificationRepository: NotificationRepository(),
            theripiestRepository: TheripiestRepository(),
            bookingRepository: BookingRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'RytLife Admin',
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        // home: MyHomePage(),
        onGenerateRoute: (settings) {
          if (basePath == '/resetPassword') {
            return MaterialPageRoute(builder: (_) => const OnBoardingPage());
          }

          return MaterialPageRoute(builder: (_) => MainApplication(appToken: token));
        },
        routes: {
          '/': (_) => MainApplication(appToken: token),
        },
        initialRoute: '/',
      ),
    );
  }
}

class MainApplication extends StatelessWidget {
  final String appToken;

  const MainApplication({super.key, this.appToken = ''});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.userStatus == UserStatus.authenticated) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
      }
    }, builder: (context, state) {
      if (appToken.isNotEmpty) {
        return const MyHomePage();
      } else {
        return const OnBoardingPage();
      }
    });
  }
}
