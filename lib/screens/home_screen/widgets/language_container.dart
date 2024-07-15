import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageContainer extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const LanguageContainer(
      {super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffEDEDF1)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.roboto(
              color: const Color(0xff020403),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
