import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/core/presentation/app_widget.dart';
import 'package:ticket_app/dependency_container.dart';
import 'package:ticket_app/ticket/presentation/bloc/ticket_cubit.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<TicketCubit>()..loadAllTickets(),
        child: const AppWidget(),
      ),
    );
  }
}
