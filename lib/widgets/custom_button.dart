import 'package:flutter/material.dart';
import 'package:quisgo/config/app_theme.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double fontSize;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fontSize = 35,
    this.isSelected = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool showGlow = _isPressed && !widget.isSelected;

    // --- LOGIKA TAMPILAN YANG DIPERBAIKI ---

    // 1. Tentukan warna latar
    final Color bgColor = showGlow ? AppColors.primary : AppColors.field;

    // 2. Tentukan warna teks yang benar
    //    - Jika tombol DIPILIH, warna teksnya UNGU.
    //    - Jika tidak (baik normal maupun ditekan), warnanya selalu EMAS.
    final Color finalTextColor = widget.isSelected
        ? AppColors.primary
        : AppColors.accent;

    // 3. Tentukan efek shadow (glow)
    final List<BoxShadow>? buttonShadow = showGlow
        ? [
      BoxShadow(
        color: AppColors.glow.withOpacity(0.9),
        blurRadius: 25,
        spreadRadius: 8,
      ),
    ]
        : null;

    // 4. Tentukan border (garis tepi)
    final Border? border = widget.isSelected
        ? Border.all(color: AppColors.border, width: 3)
        : showGlow
        ? Border.all(color: AppColors.glow.withOpacity(0.8))
        : null;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: buttonShadow,
          border: border,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonText(widget.fontSize).copyWith(
            // Terapkan warna teks yang sudah ditentukan dengan benar
            color: finalTextColor,
          ),
        ),
      ),
    );
  }
}