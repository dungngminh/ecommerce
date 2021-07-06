import 'package:flutter/material.dart';

Material customInkWel({required Widget child, void Function()? onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: child,
    ),
  );
}
