import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:beanstalk/src/presentation/auth/viewmodel/auth_viewmodel.dart';
import 'package:beanstalk/src/presentation/auth/view/login_view.dart';
import 'package:beanstalk/src/presentation/auth/view/register_view.dart';
import 'package:beanstalk/src/presentation/feed/view/home_screen.dart';
import 'package:beanstalk/src/presentation/core/view/loading_screen.dart'; // Import LoadingScreen
import 'package:beanstalk/src/data/repositories/auth_repository_impl.dart';
import 'package:beanstalk/src/data/datasources/auth_remote_datasource.dart';
import 'package:beanstalk/src/domain/usecases/auth_usecase.dart'; // Import AuthUseCase

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRemoteDataSource>(create: (_) => AuthRemoteDataSource()),
        Provider<AuthRepositoryImpl>(
          create: (context) => AuthRepositoryImpl(
            remoteDataSource: context.read<AuthRemoteDataSource>(),
          ),
        ),
        // Provide AuthUseCase
        Provider<AuthUseCase>(
          create: (context) =>
              AuthUseCase(authRepository: context.read<AuthRepositoryImpl>()),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(
            authUseCase: context.read<AuthUseCase>(), // Inject AuthUseCase
          ),
        ),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          // Display LoadingScreen during uninitialized or authenticating states
          if (authViewModel.status == AuthStatus.uninitialized ||
              authViewModel.status == AuthStatus.authenticating) {
            return const LoadingScreen();
          }

          final GoRouter router = GoRouter(
            initialLocation: '/',
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                path: '/login',
                builder: (context, state) => const LoginView(),
              ),
              GoRoute(
                path: '/register',
                builder: (context, state) => const RegisterView(),
              ),
            ],
            redirect: (BuildContext context, GoRouterState state) {
              final authStatus = authViewModel.status;
              final isAuthenticated = authStatus == AuthStatus.authenticated;

              final goingToLogin = state.matchedLocation == '/login';
              final goingToRegister = state.matchedLocation == '/register';

              if (!isAuthenticated && (goingToLogin || goingToRegister)) {
                return null; // Stay on login or register page
              }

              if (!isAuthenticated && !goingToLogin && !goingToRegister) {
                return '/login'; // Redirect to login if not authenticated
              }

              if (isAuthenticated && (goingToLogin || goingToRegister)) {
                return '/'; // Redirect to home if authenticated and trying to go to login/register
              }

              // No redirect needed
              return null;
            },
            refreshListenable: authViewModel, // Listen to auth state changes
          );

          return MaterialApp.router(
            title: 'Beanstalk',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
