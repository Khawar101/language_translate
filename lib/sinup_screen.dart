import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translate/Services/signup_service.dart';
import 'package:language_translate/widgets/button_text.dart';
import 'package:language_translate/widgets/custom_text.dart';
import 'package:language_translate/widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? profile;
  bool visibleCheck = true;
  SignupService sigUpService = SignupService();
  TextEditingController nameCTRL = TextEditingController();
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController();

  uploadProfile() async {
    try {
      await sigUpService.pickImage().whenComplete(() {
        if (sigUpService.profile.isNotEmpty) {
          setState(() {
            profile = sigUpService.profile;
            log("Profile uploaded successfully...");
          });
          log("profile..: $profile");
        } else {
          log("try again");
        }
        log("====>>>${sigUpService.profile}");
      });
    } catch (e) {
      log("sign up screen ......$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomText(
                text: "Sign In",
                textAlign: TextAlign.center,
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomText(
                  text: "Join Brainly Community",
                  color: Colors.black,
                ),
                const SizedBox(height: 6),
                CustomText(
                  text: "Subscribe quickly with us",
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Center(
                      child: profile == null
                          ? const CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(profile.toString()),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.transparent,
                            ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadProfile();
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(Icons.edit_outlined,
                                  color: Color(0xffffffff), size: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: nameCTRL,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      hintText: 'E-Mail',
                      controller: emailCTRL,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: passwordCTRL,
                      isObscureText: visibleCheck,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            visibleCheck = !visibleCheck;
                          });
                        },
                        child: Icon(
                          visibleCheck == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // ganderButton(viewModel),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    GestureDetector(
                      onTap: () {
                        // viewModel.navigateVerify();
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff4873a6).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: ButtonText(
                          text: 'Sign up',
                          color: Colors.white,
                        )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(children: [
                      const Expanded(
                          child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      )),
                      Text(
                        "OR",
                        style: GoogleFonts.ibmPlexSans(fontSize: 12),
                      ),
                      const Expanded(
                          child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      )),
                    ]),
                    const SizedBox(height: 20),
                    CustomText(
                      text: "We Never share anything on your behalf",
                    ),
                    const SizedBox(height: 27),

                    const SizedBox(height: 30)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
