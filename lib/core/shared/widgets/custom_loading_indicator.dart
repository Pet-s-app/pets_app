import 'package:flutter/material.dart';
import 'package:pets_app/core/resources/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.color = ColorManager.primary, super.key});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
