import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableDashboardTile extends StatelessWidget {
  final List<Color> gradientColors;
  final String iconPath;
  final String title;
  final String count;
  final double borderRadius;
  final double iconSize;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const ReusableDashboardTile({
    Key? key,
    required this.gradientColors,
    required this.iconPath,
    required this.title,
    required this.count,
    this.borderRadius = 19.0,
    this.iconSize = 26.0,
    this.margin = const EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
              ),
              const SizedBox(width: 14.0),
              Text(
                title,
                style: GoogleFonts.cabin(
                  color: ColorConstants.primaryDarkColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Text(
            count,
            style: GoogleFonts.cabin(
              color: ColorConstants.primaryDarkColor,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
