import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../date/driver_auth_repo.dart';
import '../../verify_phone/views/otp_view.dart';
import '../widgets/google_sigin_widget.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/build_rich_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../../../../../core/widgets/snack_bar_widget.dart';
import '../../cubit/register/driver_register_cubit.dart';
import 'upload_driver_data_view/welcome_view.dart';

class DriverRegisterView extends StatefulWidget {
  const DriverRegisterView({super.key});

  @override
  State<DriverRegisterView> createState() => _DriverRegisterViewState();
}

class _DriverRegisterViewState extends State<DriverRegisterView> {
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var passwordFocus = FocusNode();
  var nameFocus = FocusNode();
  String? selectedGender;

  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  void changeIcon() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  Widget buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Select Gender',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: selectedGender,
      items: ['female', 'male']
          .map((gender) => DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
      validator: (value) => value == null ? 'Please select a gender' : null,
    );
  }
  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    nameFocus.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DriverRegisterCubit(DriverAuthRepo()),
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
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        controller: name,
                        focusNode: nameFocus,
                        submit: (p0) =>
                            FocusScope.of(context).requestFocus(emailFocus),
                        hintText: 'الاسم',
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمة فارغة غير صالحة';
                          }
                        },
                      ),
                      SizedBox(height: screenSize(context).height * .03),
                      CustomTextFieldWidget(
                        controller: phone,
                        focusNode: phoneFocus,
                        submit: (p0) =>
                            FocusScope.of(context).requestFocus(emailFocus),
                        hintText: 'رقم الهاتف',
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمة فارغة غير صالحة';
                          }
                        },
                      ),
                      SizedBox(height: screenSize(context).height * .03),
                      buildGenderDropdown(),
                      SizedBox(height: screenSize(context).height * .05),
                      BlocConsumer<DriverRegisterCubit, DriverRegisterState>(
                          listener: (context, state) {
                        if (state is DriverRegisterSuccess) {
                          showSnackBarWidget(
                              context: context,
                              message: 'تم انشاء الحساب بنجاح',
                              requestStates: RequestStates.success);
                          navigatorOff(
                              context,
                              VerifyDriverPhoneOTPView(
                                  phone: phone.text,
                                  screen: const WelcomeView()));
                        } else if (state is DriverRegisterError) {
                          showErrorAwesomeDialog(
                              context, 'تنبيه', state.message);
                        }
                      }, builder: (context, state) {
                        return state is DriverRegisterLoading? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor),
                          ): CustomButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<DriverRegisterCubit>(context)
                                    .register(
                                        name.text.trim(),
                                        phone.text.trim(),
                                        selectedGender!,
                                );
                              }
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            color: AppColors.primaryColor,
                            title: 'ان شاء حساب');
                      }),
                      SizedBox(height: screenSize(context).height * .03),
                      // BlocConsumer<DriverRegisterCubit, DriverRegisterState>(
                      //   listener: (context, state) {
                      //     if (state is DriverGoogleRegisterSuccess) {
                      //       showSnackBarWidget(
                      //           context: context,
                      //           message: 'تم تسجيل الدخوال بنجاح',
                      //           requestStates: RequestStates.success);
                      //       navigateOff(const WelcomeView());
                      //     } else if (state is DriverGoogleRegisterError) {
                            
                      //       showErrorAwesomeDialog(
                      //           context, 'تنبيه', state.message);
                      //     }
                      //   },
                      //   builder: (context, state) {
                      //     return state is DriverGoogleRegisterLoading
                      //         ? const CustomLoadingWidget()
                      //         : GoogleSignWidget(onTap: () {
                      //             BlocProvider.of<DriverRegisterCubit>(context)
                      //                 .registerWithGoogle();
                      //           });
                      //   },
                      // ),
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
