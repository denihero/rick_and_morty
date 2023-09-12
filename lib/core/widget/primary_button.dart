
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
        required this.onPressed,
        required this.title,
        this.width = double.infinity,
        this.height = 40,
        this.borderRadius = 12,
        this.textStyle, this.backgroundColor = Colors.blue, this.elevation = 2})
      : super(
    key: key,
  );
  final Function() onPressed;
  final String title;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(elevation),
        ),
        onPressed: onPressed,
        child: Text(title, style: textStyle ?? TextStyle(
          fontSize: 20
        )),
      ),
    );
  }
}