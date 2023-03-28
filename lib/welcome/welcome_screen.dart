import 'package:blocformvalidation/sign-in/sign_in-screen.dart';
import 'package:flutter/material.dart';

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
            Center(child: Text("Example", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40),)),
            SizedBox(height: 200,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(
                  child: Text("Sign In With Email",style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
              ),
            ),
          SizedBox(height: 10,),
          Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Text("Sign In With Google",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
