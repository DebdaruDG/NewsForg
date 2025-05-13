
import 'package:flutter/material.dart';

class NewspaperFlyer extends StatelessWidget {
  final double scale;

  const NewspaperFlyer({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black),
          ),
          alignment: Alignment.center,
          child: const Text(
            'NEWS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
