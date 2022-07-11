import 'package:flutter/material.dart';

import '../../providers/theme_provider.dart';
import '../../utils/responsive.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
          child: Utils.buildResponsiveWidget(
        orientation,
        buildPotrait(context),
        buildLanscape(context),
      )),
    );
  }

  Widget buildLanscape(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildPicture(context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildLoginText(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                _buildEmailField(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                _buildLoginButton(context)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildPotrait(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildPicture(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          _buildLoginText(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildEmailField(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          _buildLoginButton(context)
        ],
      ),
    );
  }

  Widget _buildPicture(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: orientation == Orientation.portrait
          ? EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05)
          : EdgeInsets.only(
              left: 60, bottom: MediaQuery.of(context).size.height * 0.025),
      child: Center(
        child: Image(
            height: orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.5,
            image: const AssetImage(
              'assets/authentication/logo.png',
            )),
      ),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Text('Reset password',
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 40));
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

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: ThemeProvider.textFieldColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          // primary: Colors.blue,
        ),
        child: Text('Send verify email',
            style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
