import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.toc,
    required this.theme,
    required this.total,
  });

  final ThemeData toc;
  final TextStyle theme;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.blueAccent,
          color: toc.colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          children: [
            Text("Total per Person", style: theme.copyWith()),
            Text(
              "\$${total.toStringAsFixed(2)}",
              style: theme.copyWith(
                color: toc.colorScheme.onPrimary,
                fontSize: toc.textTheme.displayMedium!.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
