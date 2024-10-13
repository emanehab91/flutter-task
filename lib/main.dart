import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_three/cuibts/home_cuibt/homecuibt_cubit.dart';
import 'package:project_three/cuibts/details_cuibt/detailscuibt_cubit.dart'; // استيراد الكيوبت الخاص بالتفاصيل
import 'package:project_three/screens/home_screens.dart'; // تأكد من المسار الصحيح لشاشة الرئيسية

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomecuibtCubit()
          ),
          BlocProvider(
            create: (context) => DetailsCubit(),
          ),
        ],
        child: MaterialApp(
            title: 'Famous People',
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            home: HomeScreen(),
            ),
        );
  }
}