import 'package:astro_pro/screens/current_apod_result_page.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class AddParameterScreen extends StatefulWidget {
  @override
  State<AddParameterScreen> createState() => _AddParameterScreenState();
}

class _AddParameterScreenState extends State<AddParameterScreen> {
  TextEditingController dateInput = TextEditingController();

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
              parameter: TextField(
                controller: dateInput,
                decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 30, maxHeight: 25),
                  icon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  labelText: 'choose a date',
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
            ),
            GetAPOD(
              parameter: const Text('Random'),
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
                gradient: kGradient,
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
