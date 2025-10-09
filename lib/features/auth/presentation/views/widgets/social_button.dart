import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/core/utils/app_text_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.assetName,
    required this.label,
    this.onPressed,
  });

  final String assetName;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xffDCDEDE),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(assetName),
          title: Text(label, style: TextStyles.semiBold16,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
