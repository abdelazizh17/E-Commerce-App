import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/ephemeral_key_model/ephemeral_key_model.dart';
import '../models/payment_intent_model/init_payment_sheet_model.dart';
import '../models/payment_intent_model/payment_intent_input_model.dart';
import '../models/payment_intent_model/payment_intent_model.dart';
import '../models/stripe_customer.dart';
import '../../../../core/utils/api_keys.dart';
import 'api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();


  //* 1 - Create customer
  Future<StripeCustomer> createStripeCustomer({
  required StripeCustomer stripeCustomer
}) async {
  try {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: {
        'email': stripeCustomer.email,
        'name': stripeCustomer.name,
      },
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    // print('Raw Stripe Response: ${response.data}'); 
    return StripeCustomer.fromJson(response.data);
  } catch (e) {
    log('Stripe Service Error: $e');
    throw Exception('Failed to create Stripe customer: ${e.toString()}');
  }
}

  //*  2 - Create payment intent
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  //* 3 - Initialize payment sheet
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Hanafi',
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
      ),
    );
  }

  //* 4 - Display payment sheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        body: {'customer': customerId},
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2024-11-20.acacia',
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

   
}
