import 'package:flutter/material.dart';
import 'package:flutter_2/Final-Project/model/expense_item.dart';
// list of expense 
List<ExpenseItem> overallExpenseList=[];
// get expense list 
List<ExpenseItem> getOverallExpenseList(){
  return overallExpenseList;
}
// add new expense 
void addExpense(ExpenseItem newExpense){
overallExpenseList.add(newExpense);}
// edit expense

// delete expense
void deleteExpense(ExpenseItem expense){
  overallExpenseList.remove(expense);
}
// get the weekday 
String getWeekDayName(DateTime datetime){
  switch(datetime.weekday){
    case 1: return 'Monday';
    case 2: return 'Tueday';
    case 3: return 'Wednesday';
    case 4: return 'Thursday';
    case 5: return 'Friday';
    case 6: return 'Saturday';
    case 7: return 'Sunday';
    default: return '';
  }
}
// start from monday 
DateTime startDay(){
  DateTime? startDay;
  DateTime today= DateTime.now();
for(int i=0; i<7; i++){
  if(getWeekDayName(today.subtract(Duration(days: i)))=='Monday'){
    startDay= today.subtract(Duration(days: i));
  }
}
return startDay!;
}
// Date conveter 
String dateConverter(DateTime datetime){
String day= datetime.day.toString();
String month= datetime.month.toString();
String year= datetime.year.toString();

if(day.length==1){
  return day='0$day';
}
if(month.length==1){
  return month= '0$month';
}
String date= day+month+year;
return date;
}
// percent_indicator
Map<String, double> expenseSum(){
  Map<String, double> dailyExpenseSummary= {

  };

  for (var expense in overallExpenseList){
    String date= dateConverter(expense.dateTime);
    double amount = double.tryParse(expense.amount?.toString() ?? '') ?? 0.0;
// same date= add on
   if(dailyExpenseSummary.containsKey(date)){
    double currentAmount= dailyExpenseSummary[date]!;
    currentAmount+=amount;
    dailyExpenseSummary[date]=currentAmount;
   }
   else{
    dailyExpenseSummary.addAll({date:amount});
   }
}
return dailyExpenseSummary;
}
