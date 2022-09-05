import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAdyen {
  static const MethodChannel _channel = const MethodChannel('flutter_adyen');

  static Future<String> openDropIn(
      {paymentMethods,
      required String baseUrl,
      String authToken = '',
      required String clientKey,
      required String publicKey,
      required String locale,
      List<Map<String, String>> lineItems = const [],
      required String amount,
      required String currency,
      required String returnUrl,
      String? reference,
      required String shopperReference,
      String? shopperEmail,
      String? shopperIP,
      required String merchantAccount,
      Map<String, String> additionalData = const {},
      environment = 'TEST'}) async {
    Map<String, dynamic> args = {};
    args.putIfAbsent('paymentMethods', () => paymentMethods);
    args.putIfAbsent('additionalData', () => additionalData);
    args.putIfAbsent('baseUrl', () => baseUrl);
    args.putIfAbsent('clientKey', () => clientKey);
    args.putIfAbsent('publicKey', () => publicKey);
    args.putIfAbsent('amount', () => amount);
    args.putIfAbsent('locale', () => locale);
    args.putIfAbsent('currency', () => currency);
    args.putIfAbsent('lineItems', () => lineItems);
    args.putIfAbsent('returnUrl', () => returnUrl);
    args.putIfAbsent('environment', () => environment);
    args.putIfAbsent('shopperReference', () => shopperReference);
    args.putIfAbsent('shopperEmail', () => shopperEmail);
    args.putIfAbsent('shopperIP', () => shopperIP);
    args.putIfAbsent('authToken', () => authToken);
    args.putIfAbsent('merchantAccount', () => merchantAccount);
    args.putIfAbsent('reference', () => reference);

    final String response = await _channel.invokeMethod('openDropIn', args);
    return response;
  }
}
