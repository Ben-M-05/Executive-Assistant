
import 'package:executive_assistant/todo_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:executive_assistant/widgets/todo_container.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //TODO: Make sure database rules are changed on production build

  runApp(const MyApp());
}


final _goRoute = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?> {
                      'email': email
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                  final user = switch (state) {
                    SignedIn state => state.user,
                    UserCreated state => state.credential.user,
                    _ => null
                  };

                  if(user == null) {
                    return;
                  }

                  if(state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }

                  if(!user.emailVerified) {
                    user.sendEmailVerification();

                    const snackbar = SnackBar(
                      content: Text('Please check your email to verify your address')
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                  context.pushReplacement('/');
                })) 
               ]
             ); 
          }
        )
      ]
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => TodoNotifier(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _goRoute
      ),
    );
  }
}






