import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:short_point/utils/constant.dart';
import 'package:short_point/views/home/widgets/home_profile_header.dart';
import 'package:short_point/views/home/widgets/subscription_section.dart';
import 'package:short_point/views/home/widgets/task_section.dart';
import 'package:short_point/views/task/task_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeProfileHeader(size: size),
            SubscriptionSection(size: size),
            TaskSection(size: size),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TaskScreen();
              },
            ),
          );
        },
        child: SvgPicture.asset('assets/icons/fab.svg'),
      ),
    );
  }
}
