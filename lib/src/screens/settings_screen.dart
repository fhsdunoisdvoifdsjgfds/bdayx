import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/btn.dart';
import '../widgets/button.dart';
import '../widgets/page_title.dart';
import 'friends_screen.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(title: 'Settings'),
        SizedBox(height: 50),
        Button(
          title: 'Profile',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 22),
        Button(
          title: 'My friends',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FriendsScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 40),
        _Button(
          id: 3,
          title: 'Share with friends',
          onPressed: () => _shareApp(),
        ),
        _Divider(),
      ],
    );
  }
}

Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> _shareApp() async {
  await Share.share(
    'Check out this amazing app!',
    subject: 'App Invitation',
  );
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Btn(
      onPressed: onPressed,
      minSize: 48,
      child: Row(
        children: [
          SizedBox(width: 30),
          SvgPicture.asset('assets/settings$id.svg'),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'w800',
            ),
          ),
          Spacer(),
          Icon(
            Icons.chevron_right,
            color: Color(0xffDD0474),
            size: 28,
          ),
          SizedBox(width: 26),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white.withAlpha(3),
    );
  }
}
