import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/gen/assets.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({super.key, required this.url});
  final String url;

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

int progress = 0;

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int prog) {
            setState(() {
              progress = prog;
            });
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Assets.images.logo.image(width: 68.w, height: 42.h),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          WebViewWidget(controller: controller),
          if (progress < 100)
            Container(
              width: 1.sw,
              height: 1.sh,
              color: Colors.black.withOpacity(.25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingWidget(
                    width: 200.w,
                    height: 200.h,
                  ),
                  Text(
                    "Progress is : $progress " " %",
                    style: textStyle(color: Colors.black),
                  ),
                  10.verticalSpace,
                  LinearProgressIndicator(
                    semanticsLabel: "Progress",
                    value: progress.toDouble(),
                    color: AppColors.ffE0BC66BorderColor,
                    minHeight: 10.h,
                    semanticsValue: "kjshhdgjkj",
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
