import 'package:blocformvalidation/sign-in/bloc/sign_in_bloc.dart';
import 'package:blocformvalidation/sign-in/sign_in-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Example", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40),)),
            const SizedBox(height: 200,),
            CupertinoButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> BlocProvider(
                      create: (context)=> SignInBloc(),
                      child: SignInScreen(),
                    ),

                ));
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: const Center(
                  child: Text("Sign In With Email",style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
              ),
            ),
          const SizedBox(height: 10,),
          Container(
              height: 60,
              width: 350,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: const Center(
                child: Text("Sign In With Google",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
