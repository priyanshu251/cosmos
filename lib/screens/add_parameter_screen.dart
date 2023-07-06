import 'package:astro_pro/screens/current_apod_result_page.dart';
import 'package:astro_pro/screens/infinite_apod_page.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class AddParameterScreen extends StatefulWidget {
  const AddParameterScreen({super.key});

  @override
  State<AddParameterScreen> createState() => _AddParameterScreenState();
}

class _AddParameterScreenState extends State<AddParameterScreen> {
  DateTime date = DateTime.now();
  APODModel apodModel = APODModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/behind_bottomsheet.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
        decoration: const BoxDecoration(
          color: Color(0xFF1e222b),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Astronomical Picture Of The Day',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(
              color: Color.fromARGB(255, 160, 160, 160),
              height: 13,
              thickness: 1,
              indent: 1,
              endIndent: 1,
            ),
            const SizedBox(
              height: 20, //media querry
            ),
            GetAPOD(
              parameter: Text(
                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium,
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
              parameter: Row(children: [
                Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
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
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(255, 114, 122, 226),
                  ),
                  splashRadius: 20,
                ),
              ]),
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
              parameter: Text(
                'Random',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
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
  const GetAPOD({super.key, this.parameter, this.onPress});
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// OutlinedButton.icon(
//                 onPressed: () async {
//                   DateTime? selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: date,
//                       firstDate: DateTime(1996),
//                       lastDate: DateTime.now());
//                   if (selectedDate == null) {
//                     return;
//                   } else {
//                     setState(() {
//                       date = selectedDate;
//                     });
//                   }
//                 },
//                 label: Text(
//                   '${date.day}-${date.month}-${date.year}',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//                 icon: const Icon(Icons.calendar_today),
               
//               ),