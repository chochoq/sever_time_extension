import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ko_KR', null);

    return Scaffold(
        body: Column(
      children: [
        Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 252, 212, 108),
            child: Text(
              '서버시간 확인할게요😎',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                color: Colors.black,
              ),
            )),
        TimerBuilder.periodic(
          const Duration(milliseconds: 1),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 50,
              color: const Color.fromARGB(255, 146, 198, 253),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('y년 M월 d일').format(DateTime.now()),
                    style: GoogleFonts.notoSans(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        letterSpacing: .5),
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat('h시 mm분 s초').format(DateTime.now()),
                        style: GoogleFonts.notoSans(
                            textStyle: Theme.of(context).textTheme.headlineMedium,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: .5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        DateTime.now().millisecond.toString(),
                        style: GoogleFonts.notoSans(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ));
  }
}
