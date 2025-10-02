import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_filed.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UTip(), //to make UTip class stateful run
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _persentageTip = 0.0;
  double billTotal = 0.0;
  double totalPerPerson() {
    return ((billTotal * _persentageTip) + (billTotal) / _personCount);
  }

  double totalTip() {
    return (billTotal * _persentageTip);
  }

  //String? temp;
  @override
  Widget build(BuildContext context) {
    //copyWith() is to make us able to add more next to it
    var toc = Theme.of(context);
    double totalTp = totalTip();
    final theme = toc.textTheme.titleMedium!.copyWith(
      color: toc.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    double total = totalPerPerson();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("UTip"),

            Switch(value: false, onChanged: (value) {}),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(toc: toc, theme: theme, total: total),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(7.0),
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: toc.colorScheme.primary, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BillAmountField(
                      billAmount: billTotal.toString(),
                      onChanged: (value) {
                        setState(() {
                          billTotal = double.parse(value);
                        });
                      },
                    ),

                    // split bill area
                    PersonCount(
                      toc: toc,
                      personCount: _personCount,
                      onDecrement: () {
                        setState(() {
                          if (_personCount > 1) _personCount--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          _personCount++;
                        });
                      },
                    ),

                    //section
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip", style: toc.textTheme.titleMedium),
                          Text("\$$totalTp", style: toc.textTheme.titleMedium),
                        ],
                      ),
                    ),
                    // slider text
                    Text(
                      "${(_persentageTip * 100).round()}",
                      style: toc.textTheme.titleMedium,
                    ),
                    //tip slider
                    TipSlider(
                      persentageTip: _persentageTip,
                      onChanged: (double value) {
                        setState(() {
                          _persentageTip = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
