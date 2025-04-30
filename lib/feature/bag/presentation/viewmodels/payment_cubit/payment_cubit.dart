import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/feature/bag/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:e_commerce/feature/bag/data/repo/checkout_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    try {
      await checkoutRepo.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      emit(PaymentSuccess());
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        emit(PaymentFailure("Payment was canceled by user."));
      } else {
        emit(PaymentFailure(e.error.message ?? "Unknown Stripe error."));
      }
    } catch (e) {
      if (e is DioException) {
        emit(PaymentFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(PaymentFailure('Unexpected error'));
      }
    }
  }
}
