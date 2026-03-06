import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPic extends StatelessWidget {
  const SvgPic({super.key, required this.path, this.color, this.w, this.h});
  final String path;
  final Color? color;
  final double? w;
    final double? h;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
          width: w,
          height: h,
    );
  }
}
