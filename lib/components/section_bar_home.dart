import 'package:flutter/material.dart';
import 'package:trial1/themes/color.dart';
import 'package:trial1/themes/typo.dart';

class SectionBarHome extends StatelessWidget {
  final String? title;
  const SectionBarHome({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (title?.length ?? 20) * 27,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: CustomColorTheme.primary,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: Text(
        title ?? 'Section Title',
        style: Typo.HomeSection,
      ),
    );
  }
}
