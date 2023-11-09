import 'package:flutter/material.dart';

class SizedBox16 extends StatelessWidget {
  const SizedBox16({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.01,
    );
  }
}

class SizedBox02 extends StatelessWidget {
  const SizedBox02({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
