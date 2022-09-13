import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'cubit/solar_system_cubit.dart';
import 'cubit/solar_system_state.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late SolarSystemCubit _cubit;
  String? planetImage;
  String? planetName;
  String? planetResume;
  String? orbitalPeriodDays;
  String? orbitalPeriodYears;
  String? orbitalSpeed;
  String? sunDistance;
  String? temperature;

  void initState() {
    _cubit = BlocProvider.of<SolarSystemCubit>(context);
    callCubit();
    super.initState();
  }

  void callCubit() {
    _cubit.getSolarSystem('0');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SolarSystemCubit, SolarSystemState>(
        listener: (context, state) {
          if (state is SolarSystemLoaded) {
            setState(() {
              planetImage = state.solarSystemModel?.image;
              planetName = state.solarSystemModel?.name;
              planetResume = state.solarSystemModel?.resume;
              orbitalPeriodDays =
                  state.solarSystemModel?.features?.orbitalPeriod?[0];
              orbitalPeriodYears =
                  state.solarSystemModel?.features?.orbitalPeriod?[1];
              orbitalSpeed = state.solarSystemModel?.features?.orbitalSpeed;
              orbitalSpeed = state.solarSystemModel?.features?.orbitalSpeed;
              sunDistance = state.solarSystemModel?.features?.sunDistance;
              temperature = state.solarSystemModel?.features?.temperature;
            });
          }
          if (state is SolarSystemError) {
            Scaffold.of(context);
            SnackBar(
              content: Text(state.error),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SolarSystemLoading,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.amber,
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/svg/Rectangle.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: [
                      SafeArea(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.network(
                          planetImage ?? '',
                          height: 150,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          width: 320,
                          height: 400,
                          decoration: BoxDecoration(
                              color: const Color(0xffD74652),
                              border: Border.all(
                                color: const Color(0xffD74652),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  planetName ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Período orbital:',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  orbitalPeriodDays ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  orbitalPeriodYears ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Velocidade orbital:',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  orbitalSpeed ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Distância do Sol:',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  sunDistance ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Temperatura:',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  temperature ?? '',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 40,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('1');
                              },
                              icon: Image.asset('images/svg/mercurio.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('2');
                              },
                              icon: Image.asset('images/svg/venus.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('3');
                              },
                              icon: Image.asset('images/svg/terra.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('4');
                              },
                              icon: Image.asset('images/svg/marte.png'),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 40),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('5');
                              },
                              icon: Image.asset('images/svg/jupiter.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('6');
                              },
                              icon: Image.asset('images/svg/saturno.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('7');
                              },
                              icon: Image.asset('images/svg/urano.png'),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                _cubit.getSolarSystem('8');
                              },
                              icon: Image.asset('images/svg/netuno.png'),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
