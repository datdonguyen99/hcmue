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
  String? emailErrorText;
  String? passwordErrorText;
  bool student = false;
  bool teacher = false;
  bool parent = false;
  bool admin = false;
  var studentColor = gradientColor2;
  var teacherColor = gradientColor2;
  var parentColor = gradientColor2;
  var adminColor = gradientColor2;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Pics pics = Pics();
    bool isLoading = false;
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
        isLoading = true;
      });

      // print(_emailController.text + " | " + _passwordController.text);
      // showSnackBar('Test login', context);
      if (student) {
        Get.offAllNamed('/sthome');
      } else if (parent) {
        Get.offAllNamed('/prthome');
      } else {
        showSnackBar('Vui lòng chọn vai trò', context);
      }

      setState(() {
        isLoading = false;
      });
    }

    void updateSelectedRole({
      bool isStudent = false,
      bool isTeacher = false,
      bool isParent = false,
      bool isAdmin = false,
    }) {
      setState(() {
        student = isStudent;
        teacher = isTeacher;
        parent = isParent;
        admin = isAdmin;

        studentColor = isStudent ? gradientColor3 : gradientColor2;
        teacherColor = isTeacher ? gradientColor3 : gradientColor2;
        parentColor = isParent ? gradientColor3 : gradientColor2;
        adminColor = isAdmin ? gradientColor3 : gradientColor2;
      });
    }

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return "Email không được rỗng";
      }
      if (value.length < 6 || value.length > 50) {
        return "Email phải từ 6 đến 50 ký tự";
      }
      // RFC 5322 Standard Regex
      String pattern = r"^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return "Email không hợp lệ";
      }

      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return "Mật khẩu không được rỗng";
      }
      if (value.length < 6 || value.length > 20) {
        return "Mật khẩu từ 6 đến 20 ký tự";
      }

      return null;
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
              image: AssetImage("assets/images/login-background-squares.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 72.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: const LoginLabel(),
                    ),
                    SizedBox(height: size.height / 10),
                    Text(
                      "Tôi là:",
                      style: openSansBoldStyle(fontSize: 20, color: gray),
                    ),
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          circuledButton(
                            background: studentColor,
                            pic: pics.studentGreyPic,
                            text: 'Học sinh',
                            press: () => updateSelectedRole(isStudent: true),
                            icontextcolor: gray,
                          ),
                          circuledButton(
                            background: parentColor,
                            pic: pics.parentGreyPic,
                            text: 'Bố mẹ',
                            press: () => updateSelectedRole(isParent: true),
                            icontextcolor: gray,
                          ),
                          circuledButton(
                            background: teacherColor,
                            pic: pics.teacherGreyPic,
                            text: 'Giáo viên',
                            press: () => updateSelectedRole(isTeacher: true),
                            icontextcolor: gray,
                          ),
                          circuledButton(
                            background: adminColor,
                            pic: pics.adminGreyPic,
                            text: 'Admin',
                            press: () => updateSelectedRole(isAdmin: true),
                            icontextcolor: gray,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          children: [
                            customFormField(
                              controller: _emailController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) => validateEmail(value),
                              label: "Email",
                              prefix: Icons.email,
                              errorText: emailErrorText,
                              onChange: (String val) {
                                // print(_emailController.text);
                                setState(() {
                                  emailErrorText = validateEmail(val);
                                });
                              },
                            ),
                            SizedBox(height: 24.h),
                            customFormField(
                              controller: _passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) =>
                                  validatePassword(value),
                              label: "Mật khẩu",
                              prefix: Icons.lock,
                              suffix: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              isPassword: isPassword,
                              errorText: passwordErrorText,
                              suffixPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              onChange: (String val) {
                                // print(_passwordController.text);
                                setState(() {
                                  passwordErrorText = validatePassword(val);
                                });
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    CustomButton(press: login),
                    SizedBox(height: 32.h),
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
