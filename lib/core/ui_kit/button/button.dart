import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonX extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final Widget? child;
  final BoxBorder? border;
  final bool loading;
  final bool disabled;
  final double? borderRadius;
  final Color disabledColor;

  const ButtonX({
    required this.onTap,
    this.width,
    this.borderRadius,
    this.height,
    this.text = '',
    this.color,
    this.textColor,
    this.textStyle,
    this.margin,
    this.padding,
    this.border,
    this.loading = false,
    this.disabled = false,
    this.disabledColor = Colors.grey,
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: ScaleX(
          onTap: () {
            if (!(loading || disabled)) {
              onTap();
            }
          },
          isDisabled: disabled,
          child: Container(
            width: width,
            height: height ?? ScreenSize.h48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: disabled
                  ? disabledColor
                  : color ?? AppTheme.colors.surfaceBrand,
              borderRadius: BorderRadius.circular(
                borderRadius ?? ScreenSize.r8,
              ),
              border: border,
            ),
            child: switch (loading) {
              (true) => Center(
                    child: CupertinoActivityIndicator(
                  color: AppTheme.colors.textOnBrand,
                )),
              (false) => child ??
                  Text(
                    text,
                    style: textStyle ??
                        AppTheme.textThemeMedium.textBase.copyWith(
                          color: AppTheme.colors.textOnBrand,
                        ),
                  ),
            },
          ),
        ),
      );
}
