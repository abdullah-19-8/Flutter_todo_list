import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:short_point/controllers/task_controller.dart';
import 'package:short_point/utils/constant.dart';
import 'package:short_point/views/task/task_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.size,
    required this.index,
    required this.provider,
  });

  final Size size;
  final int index;
  final TaskController provider;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(
        top: 24,
        bottom: provider.tasks.length - 1 == index ? 100 : 0,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20 / screenWidth * size.width,
          vertical: 24 / screenHeight * size.height,
        ),
        child: Row(
          children: [
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                provider.toggleDone(index);
              },
              child: provider.tasks[index].isDone
                  ? SvgPicture.asset('assets/icons/taskDone.svg')
                  : SvgPicture.asset('assets/icons/Rectangle.svg'),
            ),
            SizedBox(
              width: 16 / screenWidth * size.width,
            ),
            Text(
              provider.tasks[index].title,
              style: TextStyle(
                decoration: provider.tasks[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
                color: provider.tasks[index].isDone
                    ? const Color(0xFF8D8D8D)
                    : const Color(0xFF071C55),
                fontSize: 16 / screenWidth * size.width,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                provider.tasks[index].isDone
                    ? Fluttertoast.showToast(
                        msg: "Can't edit completed task",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        fontSize: 16.0,
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TaskScreen(
                              task: provider.tasks[index],
                              index: index,
                            );
                          },
                        ),
                      );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF071C55),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                fixedSize: Size(
                  51 / screenWidth * size.width,
                  45 / screenHeight * size.height,
                ),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Color(0xFF071C55),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
