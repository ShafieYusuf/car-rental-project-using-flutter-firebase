import 'package:carrental/application/bloc/bloc/car_bloc.dart';
import 'package:carrental/application/presentation/screens/auth/auth_bloc/bloc/auth_bloc.dart';
import 'package:carrental/application/presentation/screens/auth/splash/splash.dart';
import 'package:carrental/application/presentation/screens/auth/view/login_view.dart';
import 'package:carrental/application/presentation/screens/usersscreen/onboarding.dart';
import 'package:carrental/application/presentation/screens/auth/view/register.dart';
import 'package:carrental/application/presentation/screens/usersscreen/carlist.dart';
import 'package:carrental/firebase_options.dart';
import 'package:carrental/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CarBloc>()..add(LoadCars()),
        ),
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPageWrapper(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const CarListScreen(),
          '/register': (context) => const RegisterPage(),
          '/onboarding': (context) => const OnboardingPage(),
        },
      ),
    );
  }
}
