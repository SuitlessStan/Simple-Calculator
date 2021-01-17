import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB3F294B);

  double _registerYOffset;
  double _loginYOffset;
  double _loginXOffset;
  double _loginWidth;
  double _loginOpacity = 1;
  double _loginHeight;
  double _marginTop = 60;
  double _registerHeight;

  double ScreenHeight;
  double ScreenWidth;

  bool _keyboardVisible = false;
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenHeight = MediaQuery.of(context).size.height;
    ScreenWidth = MediaQuery.of(context).size.width;

    _loginHeight = ScreenHeight - 230;
    _registerHeight = ScreenHeight - 230;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB3F294B);
        _loginYOffset = ScreenHeight;
        _registerYOffset = ScreenHeight;
        _loginXOffset = 0;
        _loginWidth = ScreenWidth;
        _loginOpacity = 1;
        _marginTop = 60;

        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = _keyboardVisible ? 20 : 230;
        _registerYOffset = ScreenHeight;
        _loginXOffset = 0;
        _loginWidth = ScreenWidth;
        _loginOpacity = 1;
        _marginTop = 50;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = 210;
        _registerYOffset = _keyboardVisible ? 20 : 230;
        _loginXOffset = 20;
        _loginWidth = ScreenWidth - 40;
        _loginOpacity = 0.6;
        _marginTop = 40;
        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // margin: EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 1000),
                        margin: EdgeInsets.only(top: _marginTop),
                        child: Text(
                          "Lorem ipsum",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: _headingColor,
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(35),
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Text(
                          "Eque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _headingColor,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Image.asset("assets/splash_bg.png"),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(96, 19, 96, 19),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFB40284A),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        AnimatedContainer(
          //Login

          padding: EdgeInsets.all(20),
          width: _loginWidth,
          height: _loginHeight,
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text(
                      "Login To Continue",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB40284A),
                      )),
                    ),
                  ),
                  InputWithIcon(
                    inputIcon: Icons.email,
                    inputText: "Email...",
                    safety: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputWithIcon(
                    inputIcon: Icons.keyboard_hide,
                    inputText: "Password...",
                    safety: true,
                  ),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(btnText: "Login"),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineButton(btnText: "Create An Account")),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          //Register
          height: _registerHeight,
          padding: EdgeInsets.all(20),
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Create a New Account",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB40284A),
                      )),
                    ),
                  ),
                  InputWithIcon(
                    inputIcon: Icons.email,
                    inputText: "Email...",
                    safety: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputWithIcon(
                    inputIcon: Icons.keyboard_hide,
                    inputText: "Password...",
                    safety: true,
                  ),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineButton(btnText: "Back to Login"),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFB3F294B),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            widget.btnText,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
          ),
        ));
  }
}

class OutlineButton extends StatefulWidget {
  final String btnText;
  OutlineButton({this.btnText});
  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  var _borderColor = Color(0xFFB40284A);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
            color: _borderColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
    );
  }
}

class InputWithIcon extends StatefulWidget {
  var inputIcon;
  String inputText;
  var safety = false;
  InputWithIcon({this.inputIcon, this.inputText, this.safety});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFBC7C7C7),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            child: Icon(
              widget.inputIcon,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
            child: TextField(
              obscureText: widget.safety,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.inputText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
