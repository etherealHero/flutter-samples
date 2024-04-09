import 'package:flutter/material.dart';

class RoundCheckBox extends StatefulWidget {
  const RoundCheckBox({
    super.key,
    required this.checkedColor,
    required this.onTap,
    required this.isChecked,
  });

  final bool? isChecked;
  final Color checkedColor;
  final Function(bool?)? onTap;

  @override
  State<RoundCheckBox> createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  bool? isChecked;
  Color? checkedColor;

  @override
  void initState() {
    isChecked = widget.isChecked ?? false;
    checkedColor = widget.checkedColor;
    super.initState();
  }

  @override
  void didUpdateWidget(RoundCheckBox oldWidget) {
    if (isChecked != widget.isChecked) {
      isChecked = widget.isChecked ?? false;
    }
    if (checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? GestureDetector(
            onTap: () {
              setState(() => isChecked = !isChecked!);
              widget.onTap!(isChecked);
            },
            child: ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 22.0,
                width: 22.0,
                decoration: BoxDecoration(
                  color: isChecked! ? checkedColor : Colors.transparent,
                  border: Border.all(color: checkedColor!, width: 2.0),
                  borderRadius: borderRadius,
                ),
                child: isChecked!
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15.0,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 22.0,
              width: 22.0,
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                border: Border.all(
                  color: Theme.of(context).disabledColor,
                ),
                borderRadius: borderRadius,
              ),
              child: isChecked!
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15.0,
                    )
                  : const SizedBox.shrink(),
            ),
          );
  }

  BorderRadius get borderRadius => BorderRadius.circular(24 / 2);
}
