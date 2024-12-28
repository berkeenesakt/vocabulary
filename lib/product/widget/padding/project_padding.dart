import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding() : super.all(0);

  /// All sides padding with default 20
  static EdgeInsets get all => const EdgeInsets.all(20);

  /// Horizontal padding with default 20
  static EdgeInsets get horizontalDefault => const EdgeInsets.symmetric(horizontal: 20);

  /// Vertical padding with default 20
  static EdgeInsets get verticalDefault => const EdgeInsets.symmetric(vertical: 20);

  /// Left, Right, Bottom padding with default 20
  static EdgeInsets symmetricLRB({
    double horizontal = 20,
    double bottom = 20,
  }) =>
      EdgeInsets.only(
        left: horizontal,
        right: horizontal,
        bottom: bottom,
      );

  /// Only bottom padding with default 20
  static EdgeInsets get onlyBottom => const EdgeInsets.only(bottom: 20);

  /// Only top padding with default 20
  static EdgeInsets get onlyTop => const EdgeInsets.only(top: 20);

  /// Custom symmetric padding
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );
}
