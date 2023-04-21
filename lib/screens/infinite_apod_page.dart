import 'package:flutter/material.dart';

class InfiniteAPOD extends StatefulWidget {
  InfiniteAPOD({this.aopdData, required this.index});
  dynamic aopdData;
  int index;
  List<int> apodList = [];

  @override
  State<InfiniteAPOD> createState() => _InfiniteAPODState();
}

class _InfiniteAPODState extends State<InfiniteAPOD> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        body: SingleChildScrollView(
          child: APODpair(),
        ),
      ),
    );
  }
}

class APODpair extends StatelessWidget {
  APODpair({this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0.8)),
        child: Image.network('jsdhb'),
      ),
    );
  }
}
