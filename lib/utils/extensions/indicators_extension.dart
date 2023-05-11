import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/components.dart';

/// Extension all about indicators in flutter
extension IndicatorsExtension on BuildContext {
  /// Show Error indicator
  /// [context] param must child of [Scaffold] widget
  void showErrorSnackBar({String? title, String? subTitle}) {
    List<Widget> textWidgets = [
      Text(
        title!,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      )
    ];
    if (subTitle != null && subTitle.isNotEmpty) {
      textWidgets.add(Text(subTitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )));
    }

    if (title.isNotEmpty) {
      hideCurrentSnackBar();
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/ic_danger.svg'),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: textWidgets,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: hideCurrentSnackBar,
                child: SvgPicture.asset('assets/icons/ic_close.svg'),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(this).size.height - 200,
            right: 20,
            left: 20,
          ),
          duration: Duration(seconds: 4),
          backgroundColor: Theme.of(this).errorColor,
        ),
      );
    }
  }

  /// Show Success indicator snackbar on bottom of screen
  void showSuccessSnackBar({String? title, String? subTitle}) {
    List<Widget> textWidgets = [
      Text(
        title!,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      )
    ];
    if (subTitle != null && subTitle.isNotEmpty) {
      textWidgets.add(Text(subTitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )));
    }

    if (title.isNotEmpty) {
      hideCurrentSnackBar();
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/ic_success_white.svg'),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: textWidgets,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: hideCurrentSnackBar,
                child: SvgPicture.asset('assets/icons/ic_close.svg'),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(this).size.height - 200,
            right: 20,
            left: 20,
          ),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  /// Hide current snackBar, when current scaffold available snackBar active
  void hideCurrentSnackBar() {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar();
  }

  Future<void> showLoadingDialog() {
    return showDialog(
      context: this,
      barrierDismissible: false,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (_) => const LoadingDialog(
        barrierDismissible: false,
      ),
    );
  }
}
