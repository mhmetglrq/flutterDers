import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/app_router.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      // home: const SignIn(), initialRoute olduğu zaman home çağrılmaz çünkü ilk olarak initial route yükler
      initialRoute: RouteNames.signIn,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
