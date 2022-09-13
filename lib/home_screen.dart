import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_system/information_screen.dart';
import 'package:solar_system/repository/solar_system_repository.dart';
import 'cubit/solar_system_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/svg/stars.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SvgPicture.asset("images/svg/Text.svg"),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SolarSystemCubit(
                        SolarSystemRepositoryImplementation(context),
                      ),
                      child: const InformationScreen(),
                    ),
                  ),
                );
              },
              icon: Image.asset('images/svg/Button.png'),
              iconSize: 190,
            ),
          ],
        ),
      ),
    );
  }
}
