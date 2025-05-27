import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../networking/api_error_model.dart';
import '../theming/colors.dart';

void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
  log("apiErrorModel.errors.toString(): ${apiErrorModel.errors.toString()}");
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * 0.85, // Responsive width
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Optimized Lottie widget
              _buildOptimizedLottieAnimation(),
              const SizedBox(height: 16),
              Text(
                apiErrorModel.message ?? "Unknown error",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                apiErrorModel.getErrorMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsApp.darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildOptimizedLottieAnimation() {
  return SizedBox(
    width: 180,
    height: 180,
    child: Lottie.asset(
      'assets/lottie/error_motion.json',
      frameRate: FrameRate(60), // Explicit frame rate
      delegates: LottieDelegates(
        text: (text) => text.toUpperCase(), // Optional text styling
      ),
      // Performance optimizations:
      animate: false, // Don't auto-play (wait until visible)
      repeat: false, // Only play once
      fit: BoxFit.contain,
      addRepaintBoundary: true, // Prevent unnecessary repaints
      filterQuality: FilterQuality.low, // Better for animations
      options: LottieOptions(
        enableMergePaths: true, // Reduces layers
        enableApplyingOpacityToLayers: true, // Better opacity handling
      ),
    ),
  );
}
