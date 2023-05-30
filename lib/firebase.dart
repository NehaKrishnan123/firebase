import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class profirebase extends StatefulWidget {
  const profirebase({Key? key}) : super(key: key);

  @override
  State<profirebase> createState() => _profirebaseState();
}

class _profirebaseState extends State<profirebase> {
 final TextEditingController_emailController=TextEditingController();
 final TextEditingController_passwordController=TextEditingController();
  @override
  Future<String?> login
      ({
    required String email,
    required String password,
  })
  async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            TextField(
              decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
              ),
                  hintText: 'username',
              ),
            ),
            SizedBox(height: 50,),

            TextField(
              decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
              ),
                hintText: 'password',
              ),
            ),

            TextButton(
              style:TextButton.styleFrom(backgroundColor: Colors.blueAccent),onPressed: (){}, child:Text('REGISTER',style: TextStyle(color: Colors.white),) )
          ],
        ),
      ),
      ),
    );
  }
}
