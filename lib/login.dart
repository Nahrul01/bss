import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

List<String> option = ['shift 1','shift ','shift 3'];

class _LoginState extends State<Login> {
  String _value = option[0];
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.jpg'),
            fit: BoxFit.cover)
        ),),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 400),
                const Text('Id Agen',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54)),
                TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Masukkan nomor hp"
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Passowrd',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54)),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Masukkan Password"
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Pilih ,hift',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54)),
                  Row(
                    children: [
                      Row(children: [
                        Radio(
                        value: option[0], 
                        groupValue: _value, 
                        onChanged: (value){
                          setState(() {
                            _value = value.toString();
                          });
                        }),
                        const SizedBox(width: 10,),
                        const Text('Shift 1'),
                      ],),
                    const SizedBox(width: 15,),
                  Row(children: [
                    Radio(
                   value: option[1],
                    groupValue: _value, 
                    onChanged: (value){
                      setState(() {
                        _value = value.toString();
                      });
                    }),
                    const SizedBox(width: 10,),
                    const Text('Shift 2'),
                  ],),
                  const SizedBox(width: 15,),
                  Row(children: [
                    Radio(
                    value: option[2],
                    groupValue: _value, 
                    onChanged: (value){
                      setState(() {
                        _value = value.toString();
                      });
                    }),
                    const SizedBox(width: 10,),
                    const Text('Shift 3'),
                  ],),
                ],
                ),
                const SizedBox(height: 10,),
                Center(
                  child: ElevatedButton(onPressed: signUserIn, 
                  child: const Text('Masuk'),
                  style: ElevatedButton.styleFrom(
                    minimumSize:Size(500, 60),
                    primary: Colors.blue.shade900,
                  ),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}