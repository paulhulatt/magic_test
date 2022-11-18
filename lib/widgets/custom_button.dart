import 'package:magic_test/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:magic_test/shared/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Key? key;
  final ButtonStyle? style;
  final Function()? onPressed;
  final bool isBusy;
  final BuildContext rootContext;
  final double minHeight;
  final double? minWidth;

  CustomButton(this.label, this.rootContext,
      {this.key,
      this.style,
      this.onPressed,
      this.isBusy = false,
      this.minHeight = 60,
      this.minWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[kLightBlueColor, kLightBlueColor],
                ),
              ),
            ),
          ),
          TextButton(
            key: key,
            style: style ??
                TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  foregroundColor: kBlackColor,
                  textStyle: TextStyle(fontSize: 20, color: kBlackColor),
                  minimumSize: Size(minWidth ?? double.infinity, minHeight),
                ),
            onPressed: onPressed,
            child: (isBusy)
                ? ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 21.0, maxWidth: 21.0),
                    child: CircularProgressIndicator(
                      color: kBlackColor,
                    ),
                  )
                : Text(label,
                    style: TextStyle(fontSize: 20, color: kBlackColor)),
          )
        ]));
  }
}
