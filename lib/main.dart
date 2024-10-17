import 'package:bloc_sportyo/feature/auth/login/data/repositories/auth_repository.dart';
import 'package:bloc_sportyo/feature/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_sportyo/feature/auth/login/domain/usecases/login_usecase.dart';
import 'package:bloc_sportyo/feature/auth/login/data/datasources/auth_remote_datasource.dart';
import 'package:bloc_sportyo/core/utils/shared_pref_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRemoteDataSource>(
          create: (_) => AuthRemoteDataSource(),
        ),
        Provider<AuthRepositoryImpl>(
          create: (context) =>
              AuthRepositoryImpl(context.read<AuthRemoteDataSource>()),
        ),
        Provider<LoginUseCase>(
          create: (context) => LoginUseCase(context.read<AuthRepositoryImpl>()),
        ),
        Provider<SharedPrefHelper>(
          create: (_) => SharedPrefHelper(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
