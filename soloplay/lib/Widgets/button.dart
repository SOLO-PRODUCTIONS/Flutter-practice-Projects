import 'package:flutter/material.dart';

class SoloButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final Color? backGroundColor;
  final Color? textColor;
  final VoidCallback? onTapped;
  final String? FontFamily;

  const SoloButton({
    super.key,
    required this.text,
    required this.onTapped,
    this.icon,
    this.FontFamily,
    this.backGroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style:
          ElevatedButton.styleFrom(
            minimumSize: const Size(100, 50),
            backgroundColor: backGroundColor != null
                ? backGroundColor
                : const Color.fromARGB(255, 0, 0, 0),
            side: const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ).copyWith(
            foregroundColor: WidgetStateProperty.all(Colors.white),

            overlayColor: WidgetStateProperty.resolveWith((status) {
              if (status.contains(WidgetState.pressed)) {
                return const Color.fromARGB(142, 255, 255, 255);
              } else {
                return Colors.transparent;
              }
            }),
          ),
      child: Text(text, style: TextStyle(fontFamily: FontFamily)),
    );
  }
}
