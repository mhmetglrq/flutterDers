import 'package:flutter/material.dart';

class GetWeight extends StatelessWidget {
  const GetWeight({
    super.key,
    required this.weight,
  });

  final String weight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Kilo Değeri: $weight",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
