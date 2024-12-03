import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';  // Import for UTF-8 encoding

class TradingViewTickerWidget extends StatelessWidget {
  const TradingViewTickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a WebView to render the TradingView widget.
    return WebView(
      initialUrl: Uri.dataFromString(
        '''
        <html>
          <head>
            <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async></script>
          </head>
          <body style="margin: 0; padding: 0;">
            <div class="tradingview-widget-container">
              <div class="tradingview-widget-container__widget"></div>
              <div class="tradingview-widget-copyright">
                <a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">
                  <span class="blue-text">Track all markets on TradingView</span>
                </a>
              </div>
            </div>
            <script type="text/javascript">
            new TradingView.widget({
              "symbols": [
                {"proName": "FOREXCOM:SPXUSD", "title": "S&P 500 Index"},
                {"proName": "FOREXCOM:NSXUSD", "title": "US 100 Cash CFD"},
                {"proName": "FX_IDC:EURUSD", "title": "EUR to USD"},
                {"proName": "BITSTAMP:BTCUSD", "title": "Bitcoin"},
                {"proName": "BITSTAMP:ETHUSD", "title": "Ethereum"}
              ],
              "showSymbolLogo": true,
              "isTransparent": false,
              "displayMode": "adaptive",
              "colorTheme": "dark",
              "locale": "en"
            });
            </script>
          </body>
        </html>
        ''',
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
      ).toString(),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
