import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class CheckboxX extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final Color checkColor;

  const CheckboxX({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 20.0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.checkColor = Colors.white,
  });

  @override
  _CheckboxXState createState() => _CheckboxXState();
}

class _CheckboxXState extends State<CheckboxX> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenSize.w4),
      child: GestureDetector(
        onTap: _toggleCheckbox,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _isChecked ? widget.activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: _isChecked ? widget.activeColor : widget.inactiveColor,
              width: 2.0,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    color: widget.checkColor,
                    size: widget.size * 0.6,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
