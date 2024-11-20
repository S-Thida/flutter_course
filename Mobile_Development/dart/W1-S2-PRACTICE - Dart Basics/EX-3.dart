void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // My code
 var grade= scores.where((score)=>score>=50).toList();
 print(grade);
 print("${grade.length} students passed");
}