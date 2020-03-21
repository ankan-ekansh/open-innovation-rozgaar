import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contractor_reqirenments.dart';
import 'Contractor_register.dart';

class contractorLogin extends StatefulWidget {
  @override
  _contractorLoginState createState() => _contractorLoginState();
}

class _contractorLoginState extends State<contractorLogin> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  String _id;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Contractor Login"),
      ),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24.0),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person),
                  hintText: "Your ID",
                  labelText: 'ID',
                ),
                onSaved: (String value) {
                  this._id = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              PasswordField(
                fieldKey: _passwordFieldKey,
                helperText: 'No more than 8 characters.',
                labelText: 'Password *',
                onFieldSubmitted: (String value) {
                  setState(() {
                    this._password = value;
                  });
                },
              ),
              RaisedButton(
                child: Text('Login'),
                color: Colors.black26,
                onPressed: () {
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => contractor_requirenment()));
                },
              ),
              Text("or"),
              SizedBox(height: 40.0),
              RaisedButton(
                child: Text('Register'),
                color: Colors.black26,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => contractor_registration()));
                },
              ),
            ]),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: new InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}