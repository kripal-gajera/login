import 'package:flutter/material.dart';
import 'package:login_page1/login_page/sign_in.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isObscure = true;
  String fullName = "";
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.menu,
                size: 35,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(
                      height: height / 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          fullName = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Name Is Can not Empty";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.white,
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : "Please enter a valid email";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 25,
                            color: Colors.white,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.remove_red_eye,
                            size: 25,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Container(
                      height: height / 12,
                      width: width / 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 37,
                      ),
                    ),
                    onTap: () {
                      if(formKey.currentState!.validate()){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sign_In(),
                            ));
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sign_In(),
                        ));
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
