import 'package:astro_pro/screens/current_apod_result_page.dart';
import 'package:astro_pro/screens/infinite_apod_page.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class AddParameterScreen extends StatefulWidget {
  @override
  State<AddParameterScreen> createState() => _AddParameterScreenState();
}

class _AddParameterScreenState extends State<AddParameterScreen> {
  DateTime date = DateTime.now();
  APODModel apodModel = APODModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 228, 228),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Astronomical Picture Of The Day',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 69, 69, 69),
              height: 13,
              thickness: 1,
              indent: 1,
              endIndent: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            GetAPOD(
              parameter: Text(
                DateFormat("yyyy-MM-dd").format(DateTime.now()),
              ),
              onPress: () async {
                var apodData = await apodModel.getCurrentAPOD(
                    DateFormat("yyyy-MM-dd").format(
                        DateTime.now().subtract(const Duration(days: 2))));
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CurrentAPODResultPage(apodData: apodData),
                  ),
                );
              },
            ),
            GetAPOD(
              parameter: OutlinedButton.icon(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1996),
                      lastDate: DateTime.now());
                  if (selectedDate == null) {
                    return;
                  } else {
                    setState(() {
                      date = selectedDate;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 18, 69, 187),
                ),
                label: Text(
                  '${date.year}-${date.month}-${date.day}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 70, 68, 68),
                  ),
                ),
              ),
              onPress: () async {
                var apodData = await apodModel.getCurrentAPOD(
                    DateFormat("yyyy-MM-dd")
                        .format(date.subtract(const Duration(days: 2))));
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CurrentAPODResultPage(apodData: apodData),
                  ),
                );
              },
            ),
            GetAPOD(
              parameter: const Text('Random'),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfiniteAPOD(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class GetAPOD extends StatelessWidget {
  GetAPOD({this.parameter, this.onPress});
  final Widget? parameter;

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        parameter!,
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(0),
            onPressed: onPress,
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              decoration: BoxDecoration(
                gradient: kRedGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Get',
                style: kExplorationButtonTextStyle.copyWith(fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
