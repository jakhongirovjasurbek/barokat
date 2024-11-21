part of './text_field.dart';

/// A mixin providing utility methods and properties for the `TextFormFieldX` widget.
///
/// This mixin includes methods for handling text field borders based on different states,
/// and a utility method to generate a prefix widget.
mixin _TextFormFieldXWrapper {
  /// A boolean to indicate if the text field should be in a disabled state.
  late bool isDisabled;

  /// Text style used for hint text in the text field.
  final hintStyle = AppTheme.textThemeNormal.textSm.copyWith(
    color: AppTheme.colors.textSecondary,
  );

  /// A function to create a consistent border style for the text field,
  /// using the specified color.
  Function borderX = (Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 2.w, color: color),
        borderRadius: BorderRadius.circular(ScreenSize.r8),
      );

  /// Returns the appropriate border for the text field based on its current status.
  ///
  /// The status could be one of the following:
  /// - `pure`: Default state, uses the secondary border color.
  /// - `focused`: When the field is active, uses the primary border color.
  /// - `success`: On successful input, uses the success border color.
  /// - `error`: When there is a validation error, uses the error border color.
  /// - `disabled`: When the field is disabled, uses the secondary border color.
  ///
  /// If the `isDisabled` property is set to `true`, the field will always use the
  /// secondary border color regardless of its status.
  InputBorder getBorder(
    _TextFormFieldStatus status, {
    Color? disabledBorderColor,
  }) {
    return isDisabled
        ? borderX(disabledBorderColor ?? AppTheme.colors.borderSecondary)
        : switch (status) {
            _TextFormFieldStatus.pure => borderX(
                AppTheme.colors.surfaceSecondary,
              ),
            _TextFormFieldStatus.focused => borderX(
                AppTheme.colors.borderBrand,
              ),
            _TextFormFieldStatus.error => borderX(
                AppTheme.colors.borderError,
              ),
            _TextFormFieldStatus.disabled => borderX(
                AppTheme.colors.surfaceSecondaryLowered,
              ),
          };
  }

  /// Creates a widget to display as a prefix icon, using the given [AssetX] object.
  ///
  /// The prefix icon is wrapped in padding for better alignment within the text field.
  /// If the [prefix] is `null`, this method returns `null`.
  Widget? getPrefix(AssetX? prefix) {
    if (prefix == null) {
      return null;
    }
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenSize.w16,
        right: ScreenSize.w8,
      ),
      child: AssetXWidget(asset: prefix),
    );
  }

  DecoratedBox? getLabelDecoration(
    String? label, {
    required bool isRequired,
    bool hasFocus = false,
  }) {
    if (label != null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenSize.r4),
        ),
        child: RichText(
          text: TextSpan(
            text: label,
            style: AppTheme.textThemeMedium.textSm.copyWith(
              color: hasFocus
                  ? AppTheme.colors.textBrand
                  : AppTheme.colors.textSecondary,
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: AppTheme.textThemeMedium.text2Xs.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.colors.textError,
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return null;
  }
}
