import 'package:flutter/material.dart';
import 'package:flutter_2/Final-Project/model/expense_item.dart';
// list of expense 
List<ExpenseItem> overallExpenseList=[];
// get expense list 
List<ExpenseItem> getOverallExpenseList(){
  return overallExpenseList;
}
// add new expense 
void addNewExpense(ExpenseItem newExpense){
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



// class ExpenseList extends StatefulWidget {
//   const ExpenseList({super.key});

//   @override
//   State<ExpenseList> createState() => _ExpenseListState();
// }

// class _ExpenseListState extends State<ExpenseList> {

  
//   void _addItem() async {
//     final newItem = await Navigator.of(context).push<ExpenseItem>(
//       MaterialPageRoute(
//         builder: (ctx) => NewItem(mode: Mode.creating)),
//       );
    
//     if (newItem != null) {
//       setState(() {
//         dummyGroceryItems.add(newItem);
//       });
//     }
//   }

//   void _editItem(ExpenseItem item) async {
//     final editItem = await Navigator.of(context).push<ExpenseItem>(
//       MaterialPageRoute(
//         builder: (ctx) => NewItem(mode: Mode.editing),
//       ),
//     );
//     if (_editItem != null) {
//       setState(() {
//      final grcoeryIndex= dummyGroceryItems.indexWhere((element)=> element.id==item.id);
//     if(grcoeryIndex !=-1){
//       dummyGroceryItems[grcoeryIndex]=editItem!;
//     }
//       });
//     }
  
//   }
  
// void _reorderableList(int oldIndex, int newIndex) {
//     setState(() {
//       if (newIndex > oldIndex) {
//         newIndex -= 1;
//       }
//       final item = dummyGroceryItems.removeAt(oldIndex);
//       dummyGroceryItems.insert(newIndex, item);
//     });
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(child: Text('No items added yet.'));

//     if (dummyGroceryItems.isNotEmpty) {
//       content = ReorderableListView.builder(
//         key: const PageStorageKey(''),
//         onReorder: _reorderableList,
//         itemCount: dummyGroceryItems.length,
//         itemBuilder: (ctx, index) => GroceryTile( key: ValueKey(dummyGroceryItems[index].id),dummyGroceryItems[index],
//         onTap: _editItem,
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Thida\'s Money '),
//         actions: [
//           IconButton(
//             onPressed:  _addItem,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: content,
//     );
//   }
// }

// class ExpenseTile extends StatelessWidget {
//   final Function onTap;
//   const ExpenseTile(this.groceryItem, {super.key, required this.onTap});

//   final ExpenseItem expenseItem;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(expenseItem.name),
//       leading: Container(
//         width: 24,
//         height: 24,
//         color: expenseItem.category.color,
//       ),
//       trailing: Text(
//         expenseItem.amount.toString(),
//       ),
//       onTap: ()=>onTap(expenseItem),
//     );
//   }
// }
