import 'dart:developer';

import '../models/stripe_customer.dart';
import '../services/stripe_service.dart';

class CustomerRepo {
  final StripeService stripeService;

  CustomerRepo(this.stripeService);

  Future<StripeCustomer> createStripeCustomer({
    required StripeCustomer stripeCustomer,
  }) async {
    try {
      final customer = await stripeService.createStripeCustomer(
        stripeCustomer: stripeCustomer,
      );
      return customer;
    } catch (e) {
      log('Checkout Repo Error: $e');
      throw Exception('Customer creation failed. Please try again.');
    }
  }
}
