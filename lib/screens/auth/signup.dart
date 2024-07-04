import 'dart:io';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/signup/signup_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/widgets/snackbar.dart';

class SignUpScreen extends StatefulWidget {
  Function toggleView;
  SignUpScreen({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController usernamecontroller = TextEditingController();
  // final TextEditingController controller = TextEditingController();
  // XFile? image;

  bool isObscure = true;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernamecontroller.dispose();
    super.dispose();
  }

  // void selectImage() async {
  //   image = await pickImageFromGallery(context);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor:
            Colors.white, // const Color.fromARGB(255, 232, 240, 236),
        //backgroundColor: Colors.grey[300],
        body: BlocListener<SignUpBloc, SignupState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              showSnackBar(context, 'Signup SuccessFull');
            } else if (state is SignUpFailure) {
              showSnackBar(
                  context, state.message ?? 'Signup Failed. Please Try again');
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello !,",
                                style: TextStyle(
                                    // shadows: [
                                    //   Shadow(
                                    //       color:
                                    //           AppColor.red,
                                    //       offset: Offset.zero,
                                    //       blurRadius: 4),
                                    // ],
                                    color: AppColor.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 10),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                        child: TextFormField(
                          cursorColor: AppColor.red,
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(color: AppColor.red),
                              hintText: 'Enter your name',
                              labelText: 'Username',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: AppColor.red,
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    style: BorderStyle.solid,
                                    width: 5),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.person_outline,
                                  color: AppColor.red,
                                  size: 18,
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: usernamecontroller,
                          validator: (name) {
                            if (name != null && name.length < 5)
                              return "The username should have atleast 5 characters ";
                            else if (name!.length >= 5) {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 10),
                              color: Colors.grey.withOpacity(0.2)),
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(10, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                        child: TextFormField(
                            cursorColor: AppColor.red,
                            decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: AppColor.red),
                                hintText: 'Enter your Email',
                                labelText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                      width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: AppColor.red,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      style: BorderStyle.solid,
                                      width: 5),
                                ),
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.email_outlined,
                                    color: AppColor.red,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            controller: emailController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'Please fill in this field';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                                  .hasMatch(email)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 10),
                              color: Colors.grey.withOpacity(0.2)),
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(10, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                        child: TextFormField(
                            cursorColor: AppColor.red,
                            decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: AppColor.red),
                                hintText: 'Enter your Password',
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                      width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: AppColor.red,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      style: BorderStyle.solid,
                                      width: 5),
                                ),
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.lock_outline,
                                    color: AppColor.red,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            controller: passwordController,
                            validator: (val) {
                              if (val!.isEmpty && val.length < 5) {
                                return 'Password should have min 5 characters ';
                              }
                              // else if (!RegExp(
                              //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                              //     .hasMatch(val)) {
                              //   return 'Please enter a valid password';
                              // }
                              return null;
                            }),
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    // TextButton.icon(
                    //   label: const Text('Select Profile Pic'),
                    //   onPressed: selectImage,
                    //   icon: const Icon(
                    //     Icons.add_a_photo,
                    //   ),
                    // ),

                    // const SizedBox(
                    //   height: 15,
                    // ),

                    Builder(builder: (context) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.redDark1),
                          onPressed: () async {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              // if (image != null) {
                              //   await context.read<AuthMethods>().phoneSignUp(
                              //         context,
                              //         phoneNumber: emailController.text,
                              //         username: usernamecontroller.text,
                              //         profilePic: File(image!.path),
                              //       );
                              // } else {
                              //   showSnackBar(context, "Choose a Profile Image");
                              // }

                              UserModel user = UserModel.empty;

                              user.copyWith(
                                  email: emailController.text,
                                  username: usernamecontroller.text);

                              context.read<SignUpBloc>().add(SignUpRequired(
                                  user,
                                  emailController.text,
                                  passwordController.text,
                                  usernamecontroller.text));
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ));
                    }),

                    // Container(
                    //   height: 50,
                    //   width: MediaQuery.of(context).size.width * 0.70,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: AppColor.red,
                    //           shadowColor: GlobalVariables.selectedNavBarColor,
                    //           shape: StadiumBorder(side: BorderSide.none)),
                    //       onPressed: () {},
                    //       child: Text("Sign in with Google")),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 50,
                    //   width: MediaQuery.of(context).size.width * 0.70,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: AppColor.red,
                    //           shadowColor: GlobalVariables.selectedNavBarColor,
                    //           shape: StadiumBorder(side: BorderSide.none)),
                    //       onPressed: () {},
                    //       child: Text("Sign in with FaceBook")),
                    // ),

                    // Container(
                    //   height: 50,
                    //   width: MediaQuery.of(context).size.width * 0.70,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: AppColor.red,
                    //           shadowColor: GlobalVariables.selectedNavBarColor,
                    //           shape: StadiumBorder(side: BorderSide.none)),
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, PhoneSignInScreen.route);
                    //       },
                    //       child: Text("Sign in with Phone Number")),
                    // ),

                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            wordSpacing: 2,
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            widget.toggleView();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: AppColor.red),
                          ),
                        )
                      ],
                    )

                    // TextField(
                    //   controller: passwordcontroller,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
