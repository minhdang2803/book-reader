import 'package:book_reader/providers/theme_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildPicture(context),
              _buildLoginText(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _buildEmailField(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              _buildPasswordField(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              _buildOptions(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPicture(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: const Center(
        child: Image(image: AssetImage('assets/authentication/logo.png')),
      ),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Text('Login',
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 58));
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter email',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.normal)),
          const SizedBox(height: 8),
          TextFormField(
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 15, decoration: TextDecoration.none),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: ThemeProvider.hintTextColor,
                  ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: ThemeProvider.textFieldColor),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: ThemeProvider.textFieldColor)),
            ),
            autocorrect: false, // remove underline of text when input
            enableSuggestions: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter password',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.normal)),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: _isVisible,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 15, decoration: TextDecoration.none),
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ThemeProvider.hintTextColor,
                    ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: ThemeProvider.textFieldColor),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: ThemeProvider.textFieldColor)),
                suffixIcon: GestureDetector(
                  child: Icon(Icons.remove_red_eye),
                  //TODO Done later with provider
                  onLongPress: () => setState(() {
                    _isVisible = !_isVisible;
                  }),
                  //TODO Done later with provider
                  onLongPressUp: () => setState(() {
                    _isVisible = !_isVisible;
                  }),
                )),
            autocorrect: false, // remove underline of text when input
            enableSuggestions: false,
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: null,
                child: Text(
                  'Register',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: ThemeProvider.textFieldColor),
                ),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    'Reset pasword',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: ThemeProvider.textFieldColor),
                  )),
            ]));
  }
}
