import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradingViewTickerWidget extends StatefulWidget {
  final String symbol;

  const TradingViewTickerWidget({Key? key, required this.symbol}) : super(key: key);

  @override
  _TradingViewTickerWidgetState createState() => _TradingViewTickerWidgetState();
}

class _TradingViewTickerWidgetState extends State<TradingViewTickerWidget> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString('''
        <html>
          <body style="margin:0;padding:0;">
            <div class="tradingview-widget-container">
              <div id="tradingview_widget"></div>
              <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
              {
                "symbol": "${widget.symbol}",
                "width": "100%",
                "height": "100%",
                "locale": "en",
                "colorTheme": "dark",
                "isTransparent": true
              }
              </script>
            </div>
          </body>
        </html>
      ''');
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}