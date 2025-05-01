import 'dart:developer';
import '../models/payment_intent_model/payment_intent_input_model.dart';
import '../services/stripe_service.dart';

class CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepo(this.stripeService);
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
    } on Exception catch (e) {
      log('checkout repo : ${e.toString()}');
      rethrow;
    }
  }
}
