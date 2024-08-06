part of 'driver_forget_password_cubit.dart';

class DriverForgetPasswordState extends Equatable {
  const DriverForgetPasswordState();

  @override
  List<Object> get props => [];
}

class DriverForgetPasswordInitial extends DriverForgetPasswordState {}

class ForgetPasswordLoadingState extends DriverForgetPasswordState {}

class ForgetPasswordSuccessState extends DriverForgetPasswordState {}

class ForgetPasswordErrorState extends DriverForgetPasswordState {
  final String message;
  const ForgetPasswordErrorState({required this.message});
}

class ReSendForgetPasswordVerificationCodeToPhoneState
    extends DriverForgetPasswordState {
  final String message;
  ReSendForgetPasswordVerificationCodeToPhoneState({required this.message});
}

class ReSendForgetPasswordVerificationCodeToPhoneLoadingState
    extends DriverForgetPasswordState {}

class ReSendForgetPasswordVerificationCodeToPhoneErrorState
    extends DriverForgetPasswordState {
  final String message;
  ReSendForgetPasswordVerificationCodeToPhoneErrorState(
      {required this.message});
}

class ForgetPasswordOTPCodeLoadingState extends DriverForgetPasswordState {}

class ForgetPasswordOTPSuccessState extends DriverForgetPasswordState {}

class ForgetPasswordOTPErrorState extends DriverForgetPasswordState {
   final String message;
  const ForgetPasswordOTPErrorState({required this.message});
}

class NewForgetPasswordLoadingState extends DriverForgetPasswordState {}

class NewForgetPasswordSuccessState extends DriverForgetPasswordState {}

class NewForgetPasswordErrorState extends DriverForgetPasswordState {
  final String message;
  const NewForgetPasswordErrorState({required this.message});
}
