import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

final _formkey = GlobalKey<FormState>();

class LoginPageState extends State<LoginPage>{

  void moveToRegister(){
    setState((){
      registerPage=true;
    });
  }
  void moveToLogin(){
    setState((){
      registerPage=false;
    });
  }

  bool registerPage = false;
  String _email,_password;
  bool validateAndSave(){
    if(_formkey.currentState.validate()){
      return true;
    }
    return false;
  }
  void validateAndSubmit(){
    if(validateAndSave()){

    }
  }

  Widget build(BuildContext context){
    return  Scaffold(
        appBar: AppBar(title: new Text('Login')),
        body:  Container(
          padding:EdgeInsets.all(10.0),
          child: Form(
            key:_formkey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildField()+buildButtons(),
            ),
          ),
        )
    );
  }
  List<Widget> buildField(){
    List<Widget> list =
    [
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(fontSize:20.0),
        ),
        validator: (value)=> value.isEmpty ? 'Email is not valid':null ,
        onSaved: (value)=>{_email=value},
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(fontSize:20.0),
        ),
        validator: (value)=> value.isEmpty ? 'Password is not valid':null ,
        onSaved: (value)=>{_password=value},
      ),
    ];
    return list;

  }
  List<Widget> buildButtons(){
    if(registerPage){
      return
        [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(fontSize:20.0),
            ),
            validator: (value)=> value.isEmpty ? 'Name is not valid':null ,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Age',
              labelStyle: TextStyle(fontSize:20.0),
            ),
            validator: (value)=> value.isEmpty ? 'Age is not valid':null ,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'School/Institute',
              labelStyle: TextStyle(fontSize:20.0),
            ),
            validator: (value)=> value.isEmpty ? 'Institute is not valid':null ,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Phone(Optional)',
              labelStyle: TextStyle(fontSize:20.0),
            ),

          ),

          RaisedButton(
            onPressed:validateAndSubmit ,
            child: Text('Create an account'),
          ),
          FlatButton(
              onPressed:moveToLogin,
              child: Text('Already have an account? Login ')
          )
        ];
    }
    return [
      RaisedButton(
        onPressed:validateAndSubmit ,
        child: Text('Login'),
      ),
      FlatButton(
          onPressed:moveToRegister,
          child: Text('Create an account')
      )
    ];

  }
}

