import 'package:flutter/material.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/models/course.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/widgets/score_form.dart';



class CoursesView extends StatefulWidget {
  const CoursesView(
      {super.key, required this.course,});

  final List<Course> course;
  
  
  @override
  _CoursesViewState createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  get registeredStudentScore => null;




  void onCourseCreated(StudentScore newScore) {
    setState(() {
      registeredStudentScore.add(newScore);
    });
  }
    void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ScoreForm(
        onCreated: onCourseCreated,
       
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.course.length,
        itemBuilder: (context, index)=> const Text(course[index]),
    );  
  }
}