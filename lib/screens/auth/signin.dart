import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/utils/extensions/num_extensions.dart';
import 'package:netflix_clone/widgets/snackbar.dart';

class SigninScreen extends StatefulWidget {
  Function toggleView;
  SigninScreen({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  // bool islogged = false;

  @override
  void initState() {
    // getSellerData();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // void getSellerData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     islogged = prefs.getBool("isUserRegistered")!;
  //     print("the islogged in 1 is $islogged");
  //   });
  //   if (islogged == null) {
  //     setState(() {
  //       islogged = false;
  //       print('he islogged in 2 $islogged');
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor:
            AppColor.white, // const Color.fromARGB(255, 232, 240, 236),
        //backgroundColor: Colors.grey[300],
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              showSnackBar(context, 'SignIn SuccessFull');
            } else if (state is SignInFailure) {
              showSnackBar(
                  context, state.message ?? 'SignIn Failed. Please Try again');
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
                    //   TextField(controller: usernamecontroller),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.30,
                    //   width: MediaQuery.of(context).size.width * 0.90,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12), color: pinkcolor),
                    // ),
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
                            children: const [
                              Text(
                                "Welcome Back!,",
                                style: TextStyle(
                                    // shadows: [
                                    //   Shadow(
                                    //       color:
                                    //          AppColor.red,
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
                      height: 30,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: AppColor.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Builder(builder: (context) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.redDark1),
                          onPressed: () async {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();

                              context.read<SignInBloc>().add(SignInRequired(
                                  emailController.text,
                                  passwordController.text));
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ));
                    }),
                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
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
                            //         builder: (context) => const SigninScreen()));
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: AppColor.red),
                          ),
                        )
                      ],
                    ),

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
