import 'package:chat_app/blocs/bloc/auth_bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  static String id = 'LoginPage';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state){
        if (state is LoginSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessage() ;
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        } else if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginFailure) {
          ShowSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                  key: globalKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        kLogo,
                        height: 100,
                        width: 100,
                      ),
                      const Text(
                        "Scholar Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      CustomFormTextField(
                        hintText: "Email",
                        onChanged: (data) {
                          email = data;
                        },
                      ),
                      CustomFormTextField(
                        hintText: "Password",
                        onChanged: (data) {
                          password = data;
                        },
                        obsecureText: true,
                      ),
                      CustomButton(
                        name: "Log In",
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(RegisterEvent(email: email!, password: password!))  ;
                          }
                          
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, RegisterPage.id),
                              child: const Text(
                                "REGISTER NOW",
                                style: TextStyle(
                                  color: Color(0xffC7EDE6),
                                ),
                              )),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
