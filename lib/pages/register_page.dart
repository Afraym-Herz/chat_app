import 'package:chat_app/blocs/bloc/auth_bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  static String id = 'RegisterPage';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        
        if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        } else if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFailure) {
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
                          "REGISTER",
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
                    ),
                    CustomButton(
                        name: "Register",
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!)) ;
                            
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account?  ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                color: Color(0xffC7EDE6),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
