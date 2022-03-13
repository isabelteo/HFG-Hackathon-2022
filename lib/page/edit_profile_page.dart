import 'package:flutter/material.dart';
import 'package:hfg/model/user.dart';
import 'package:hfg/utils/user_preferences.dart';
import 'package:hfg/widget/appbar_widget.dart';
import 'package:hfg/widget/profile_widget.dart';
import 'package:hfg/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

  class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Country',
              text: user.country,
              onChanged: (country) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'What is your housing situation?',
              text: user.housing,
              maxLines: 5,
              onChanged: (housing) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'What is your job?',
              text: user.job,
              maxLines: 1,
              onChanged: (job) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'What are your hobbies?',
              text: user.hobbies,
              maxLines: 1,
              onChanged: (hobbies) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'When is your birthday?',
              text: user.birthday,
              maxLines: 1,
              onChanged: (birthday) {},
            ),
          ],
        ),
      );
}