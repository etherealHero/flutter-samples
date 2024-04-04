import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  static const _horizontalSidePadding = 24.0;

  const PagePadding()
      : super.only(left: _horizontalSidePadding, right: _horizontalSidePadding);
}
