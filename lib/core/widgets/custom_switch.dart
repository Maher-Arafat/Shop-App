import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      return null;
    });
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber.withOpacity(.54);
      }

      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return null;
    });

    return Switch(
        value: light,
        trackColor: trackColor,
        overlayColor: overlayColor,
        thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
        onChanged: (bool val) {
          setState(() {
            light = val;
          });
        });
  }
}
