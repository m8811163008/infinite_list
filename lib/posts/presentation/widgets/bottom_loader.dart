import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 24.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
