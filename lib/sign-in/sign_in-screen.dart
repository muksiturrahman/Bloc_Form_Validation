import 'package:blocformvalidation/sign-in/bloc/sign_in_bloc.dart';
import 'package:blocformvalidation/sign-in/bloc/sign_in_event.dart';
import 'package:blocformvalidation/sign-in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In with Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state){
                if(state is SignInErrorState){
                  return Text(state.errorMessage, style: TextStyle(color: Colors.red),);
                }
                else{
                  return Container();
                }
              }
            ),
            TextField(
              controller: emailController,
              onChanged: (val){
                BlocProvider.of<SignInBloc>(context).add(
                 SignInTextChangedEvent(emailController.text, passwordController.text)
                );
              },
              decoration: InputDecoration(
                hintText: "Email Address"
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              onChanged: (val){
                BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text)
                );
              },
              decoration: InputDecoration(
                   hintText: "Password"
              ),
            ),
            const SizedBox(height: 20,),
            BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state){
                  if(state is SignInLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }
              return CupertinoButton(
                  color: (state is SignInValidState) ?Colors.blue : Colors.grey,
                  onPressed: (){
                    if(state is SignInValidState){
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(emailController.text, passwordController.text)
                      );
                    }
                  },
                  child: const Text("Sign In")
              );
            })

          ],
        ),
      ),
    );
  }
}
