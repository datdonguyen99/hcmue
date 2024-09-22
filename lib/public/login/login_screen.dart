import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcmue/public/widgets/circuled_button.dart';
import 'package:hcmue/public/widgets/custom_button.dart';
import 'package:hcmue/public/widgets/custom_formfield.dart';
import 'package:hcmue/public/login/login_label.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Pics pics = Pics();
    bool _isLoading = false;
    // final RoundedLoadingButtonController _buttonController =
    //     RoundedLoadingButtonController();

    @override
    void dispose() {
      super.dispose();
      _emailController.dispose();
      _passwordController.dispose();
    }

    void login() async {
      setState(() {
        _isLoading = true;
      });

      showSnackBar('Test login', context);
      // Get.offAllNamed('/sthome');
      Get.offAllNamed('/prthome');

      setState(() {
        _isLoading = false;
      });
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/login-background-squares.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 72.h,
                    ),
                    const LoginLabel(),
                    SizedBox(
                      height: size.height / 10,
                    ),
                    Text(
                      "Tôi là:",
                      style: openSansBoldStyle(fontSize: 24, color: gray),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          circuledButton(
                            background: gradientColor,
                            pic: pics.studentGreyPic,
                            text: 'Học sinh',
                            press: () {},
                            icontextcolor: gray,
                          ),
                          circuledButton(
                            background: gradientColor,
                            pic: pics.parentGreyPic,
                            text: 'Bố mẹ',
                            press: () {},
                            icontextcolor: gray,
                          ),
                          circuledButton(
                            background: gradientColor,
                            pic: pics.teacherGreyPic,
                            text: 'Giáo viên',
                            press: () {},
                            icontextcolor: gray,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          children: [
                            customFormField(
                              controller: _emailController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                return value!.isEmpty
                                    ? "Email không được rỗng"
                                    : null;
                              },
                              label: "Email",
                              prefix: Icons.email,
                              onChange: (String val) {
                                print(_emailController.text);
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            customFormField(
                              controller: _passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                return value!.isEmpty
                                    ? "Mật khẩu không được rỗng"
                                    : null;
                              },
                              label: "Mật khẩu",
                              prefix: Icons.lock,
                              suffix: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              isPassword: isPassword,
                              suffixPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              onChange: (String val) {
                                print(_passwordController.text);
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    CustomButton(
                      press: login,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
