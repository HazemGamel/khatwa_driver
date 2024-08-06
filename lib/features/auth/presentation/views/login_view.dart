import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/cache_storage_services.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../home/views/main_view.dart';
import '../../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/build_rich_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../../../../../core/widgets/snack_bar_widget.dart';
import '../../cubit/login/driver_login_cubit.dart';
import '../../date/driver_auth_repo.dart';
import '../../forget_password/view/forget_password_view.dart';
import '../../verify_phone/views/otp_view.dart';
import '../widgets/google_sigin_widget.dart';
import 'register_view.dart';

class DriverLoginView extends StatefulWidget {
  const DriverLoginView({super.key});

  @override
  State<DriverLoginView> createState() => _DriverLoginViewState();
}

class _DriverLoginViewState extends State<DriverLoginView> {
  final phone = TextEditingController();

  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var phoneFocus = FocusNode();

  var passwordFocus = FocusNode();
  bool isObscure = true;
  void changeIcon() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DriverLoginCubit(DriverAuthRepo()),
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize(context).height * .06),
                      Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CustomAssetsImage(
                                path: 'assets/logo2.jpeg'),
                          )),
                      SizedBox(height: 10,),
                      const Center(
                          child: Text(" يلا خطوة",style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),)),
                      SizedBox(height: screenSize(context).height * .05),
                      CustomTextFieldWidget(
                        controller: phone,
                        hintText: 'رقم الهاتف',
                        focusNode: phoneFocus,
                        keyboard: TextInputType.emailAddress,
                        submit: (p0) =>
                            FocusScope.of(context).
                            requestFocus(phoneFocus),
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمة فارغة غير صالحة';
                          }

                        },
                      ),
                      SizedBox(height: screenSize(context).height * .03),
                      BlocConsumer<DriverLoginCubit, DriverLoginState>(
                          listener: (context, state) {
                        if (state is DriverLoginSuccess) {
                          showSnackBarWidget(
                              context: context,
                              message: 'تم تسجيل الدخوال بنجاح',
                              requestStates: RequestStates.success);
                          navigateOff(const MainView());
                        } else if (state is DriverSendCodeToEmailState) {
                          showSnackBarWidget(
                              context: context,
                              message:
                                  "لقد تم ارسال كود التحقق الي رقم الهاتف ",
                              requestStates: RequestStates.success);
                          navigatorOff(
                              context,
                              VerifyDriverPhoneOTPView(
                                phone: phone.text,
                                screen: const MainView(),
                              ));
                        } else if (state is DriverLoginError) {
                          showErrorAwesomeDialog(
                              context, 'تنبيه', state.message);
                        }
                      }, builder: (context, state) {
                        if (state is DriverLoginLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor),
                          );
                        }
                        return CustomButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<DriverLoginCubit>(context)
                                    .login(phone.text.trim());
                              }
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            color: AppColors.primaryColor,
                            title: 'تسجيل الدخول');
                      }),
                      SizedBox(height: screenSize(context).height * .03),
                      // BlocConsumer<DriverLoginCubit, DriverLoginState>(
                      //   listener: (context, state) {
                      //     if (state is DriverGoogleLoginSuccess) {
                      //       showSnackBarWidget(
                      //           context: context,
                      //           message: 'تم تسجيل الدخوال بنجاح',
                      //           requestStates: RequestStates.success);
                           
                      //       navigateOff(const MainView());
                      //     } else if (state is DriverGoogleLoginError) {
                      //       showErrorAwesomeDialog(
                      //           context, 'تنبيه', state.message);
                      //     }
                      //   },
                      //   builder: (context, state) {
                      //     return state is DriverGoogleLoginLoading
                      //         ? const CustomLoadingWidget()
                      //         : GoogleSignWidget(onTap: () {
                      //             BlocProvider.of<DriverLoginCubit>(context)
                      //                 .loginWithGoogle();
                      //           });
                      //   },
                      // ),
                      Align(
                          alignment: Alignment.center,
                          child: CustomTextButton(
                              function: () {
                                navigateTo(const DriverRegisterView());
                              },
                              color: AppColors.primaryColor,
                              title: 'انشاء حساب جديد')),
                      SizedBox(height: screenSize(context).height * .03),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
