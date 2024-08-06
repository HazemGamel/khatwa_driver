import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/checkinternet.dart';
import '../data/forgetpassword_repo.dart';

part 'driver_forget_password_state.dart';

class DriverForgetPasswordCubit extends Cubit<DriverForgetPasswordState> {
  final DriverForgetPasswordRepo _driverForgetPasswordRepo;

  DriverForgetPasswordCubit(this._driverForgetPasswordRepo)
      : super(DriverForgetPasswordInitial());

  static DriverForgetPasswordCubit get(context) => BlocProvider.of(context);

  void sendPhone(String phone) async {
    if (await checkInternet()) {
      emit(ForgetPasswordLoadingState());
      final result = await _driverForgetPasswordRepo
          .sendForgetPasswordVerificationCodeToPhone(phone);
      result.fold((l) => emit(ForgetPasswordErrorState(message: l)),
          (r) => emit(ForgetPasswordSuccessState()));
    } else {
      emit(const ForgetPasswordErrorState(message: "لا يوجد اتصال بالانترنت"));
    }
  }

  
   void reSendForgetPasswordVerificationCodeToEmail(String email) async {
    emit(ReSendForgetPasswordVerificationCodeToPhoneLoadingState());
    final result = await _driverForgetPasswordRepo
        .reSendForgetPasswordVerificationCodeToPhone(email);
    result.fold(
      (l) => emit(
          ReSendForgetPasswordVerificationCodeToPhoneErrorState(message: l)),
      (r) => emit(ReSendForgetPasswordVerificationCodeToPhoneState(message: r)),
    );
  }

  void verifyPhoneWithCode(String phone, int code) async {
    if (await checkInternet()) {
      emit(ForgetPasswordOTPCodeLoadingState());
      final result = await _driverForgetPasswordRepo
          .verifyDriverForgetPasswordCode(phone, code);
      result.fold((l) => emit(ForgetPasswordOTPErrorState(message: l)),
          (r) => emit(ForgetPasswordOTPSuccessState()));
    } else {
      emit(const ForgetPasswordOTPErrorState(
          message: "لا يوجد اتصال بالانترنت"));
    }
  }

  void newPassword(String password) async {
    if (await checkInternet()) {
      emit(NewForgetPasswordLoadingState());
      final result = await _driverForgetPasswordRepo.sentNewPassword(password);
      result.fold((l) => emit(NewForgetPasswordErrorState(message: l)),
          (r) => emit(NewForgetPasswordSuccessState()));
    } else {
      emit(const NewForgetPasswordErrorState(
          message: "لا يوجد اتصال بالانترنت"));
    }
  }
}
