import 'package:flutter/material.dart';
import 'package:hfg/model/user.dart';
import 'package:hfg/page/edit_profile_page.dart';
import 'package:hfg/utils/user_preferences.dart';
import 'package:hfg/widget/appbar_widget.dart';
import 'package:hfg/widget/button_widget.dart';
import 'package:hfg/widget/profile_widget.dart';

void main() {
  runApp(const MyApp());
}

const String page1 = "Main";
const String page2 = "Chat";
const String page3 = "Profile";
const String title = "On The House";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _chat;
  late Widget _main;
  late Widget _profile;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _main = const Page1();
    _chat = const Page2();
    _profile = const Profile();
    _pages = [_chat,_main,_profile];
    _currentIndex = 0;
    _currentPage = _profile;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(Icons.wechat_rounded),
            ),
        BottomNavigationBarItem(
          label: "Main",
          icon: Icon(Icons.home),
        ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle("Profile", 2),
              _navigationItemListTitle("Main", 1),
              _navigationItemListTitle("Chat", 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page1 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page2 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final user = UserPreferences.myUser;

      return new Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(child: buildDonateButton()),
                const SizedBox(height: 24),
                buildAbout(user),
                const SizedBox(height: 24),
                buildHousing(user),
                const SizedBox(height: 24),
                buildJob(user),
                const SizedBox(height: 24),
                buildHobbies(user),
                const SizedBox(height: 24),
                buildBirthday(user),
              ],
            ),
          );
    }

    Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.country,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

    Widget buildDonateButton() => ButtonWidget(
      text: 'Handle Your Financials',
      onClicked: () {},
    );

    Widget buildJob(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.job,
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );

    Widget buildHobbies(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hobbies',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.hobbies,
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );

    Widget buildBirthday(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birthday',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.birthday,
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );

    Widget buildHousing(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Housing Situation',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.housing,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );

    Widget buildAbout(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );

  }