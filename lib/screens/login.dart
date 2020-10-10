import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue[900],
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children : <Widget>[
                Text("LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                SizedBox(height : 10) ,
                Text("Welcome to BIET Jhansi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    ),
                ),
              ],
            ),
          ),

          SizedBox(height : 120),
          Expanded(
            child : Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius : BorderRadius.only(topLeft: Radius.circular(50) , topRight : Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child : Padding(
                  padding : EdgeInsets.all(30),
                  child : Column(
                    children: <Widget>[
                      SizedBox(height : 30) ,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(2, 12, 100, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10)
                          )]
                        ),
                        child: TextFormField(
                          
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                          hintText: "Enter Roll Number",
                          prefixIcon: Icon(Icons.keyboard),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                          ),
                        ),
                      ),

                      SizedBox(height : 30) ,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(2, 12, 100, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10)
                          )]
                        ),
                        child: TextFormField(
                          
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                          ),

                        ),
                      ),

                      SizedBox(height: 30,),
                      Text("Forgot Password?", style: TextStyle(color: Colors.blue[700]),),
                      SizedBox(height: 40,),
                      GestureDetector(
                        onTap: (){
                          print("button Clicked");
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[900]
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      
                    ],
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}