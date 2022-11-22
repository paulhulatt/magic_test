import 'package:magic_test/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:magic_test/shared/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final ButtonStyle? style;
  final Color backgroundColor;
  final Function()? onPressed;
  final bool isBusy;
  final BuildContext rootContext;
  final double minHeight;
  final double? minWidth;

  CustomButton(this.label, this.rootContext,
      {Key? key,
      this.style,
      this.backgroundColor = kBlackColor,
      this.onPressed,
      this.isBusy = false,
      this.minHeight = 60,
      this.minWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: kBlackColor,
                  border: Border.all(color: kLightBlueColor, width: 3)),
            ),
          ),
          TextButton(
            key: key,
            style: style ??
                TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  foregroundColor: kLightBlueColor,
                  textStyle:
                      TextStyle(fontSize: minHeight / 3, color: kBlackColor),
                  minimumSize: Size(minWidth ?? double.infinity, minHeight),
                ),
            onPressed: onPressed,
            child: (isBusy)
                ? ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: minHeight / 3, minWidth: minHeight / 3),
                    child: const CircularProgressIndicator(
                      color: kLightBlueColor,
                    ),
                  )
                : Text(label,
                    style: TextStyle(
                        fontSize: minHeight / 3, color: kLightBlueColor)),
          )
        ]));
  }
}
