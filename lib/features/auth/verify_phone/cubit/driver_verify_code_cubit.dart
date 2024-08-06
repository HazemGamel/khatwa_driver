import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/checkinternet.dart';

import '../data_source/verify_email_repo.dart';

part 'driver_verify_code_state.dart';

class DriverVerifyCodeCubit extends Cubit<DriverVerifyCodeState> {
 final VerifyDriverPhoneAddressRepo verifyPhoneAddressRepo;

  DriverVerifyCodeCubit(this.verifyPhoneAddressRepo) :
        super(DriverVerifyCodeInitial());

  static DriverVerifyCodeCubit get(context) => BlocProvider.of(context);

  void verifyPhoneWithCode(String phone, String code) async {
    if(await checkInternet()){
    emit(OtpLoadingState());
    final result =
        await verifyPhoneAddressRepo.
        driverVerifyPhoneCode(phone, code);
    result.fold((l) =>
        emit(OtpErrorState(message:l)), (r) => emit(OtpSuccessState()));
           } else {
      emit(const OtpErrorState(message: 'لايوجد اتصال بالانترنت'));
    }
  }

  void resendEmailVerifyCode(String phone) async {
    emit(ResendOtpLoadingState());
    final result = await verifyPhoneAddressRepo.
    clientResendPhoneCode(phone);
    result.fold((l) => emit(ResendOtpErrorState(message: l)),
        (r) => emit(ResendOtpSuccessState(message: r)));
  }
}
