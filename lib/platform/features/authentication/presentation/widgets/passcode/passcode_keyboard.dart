import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasscodeKeyboard extends StatelessWidget {
  const PasscodeKeyboard({
    super.key,
    required this.onPressed,
    required this.size,
    required this.child,
  });

  final VoidCallback onPressed;
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        SystemSound.play(SystemSoundType.click);
        onPressed.call();
      },
      shape: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          bottom: ScreenSize.h10,
          left: ScreenSize.w6,
          right: ScreenSize.w6,
        ),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}
