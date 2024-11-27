
class Address{
  final String _street;
  final String _city;
  final int _zipCode;
  Address(this._street, this._city, this._zipCode);
  String get street=>_street;
  String get city=> _city;
  num get zipCode=> _zipCode;

  @override
  String toString() {
    return '$_street, $_city, $_zipCode';
  } 
}


  enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final num _baseSalary;
   List<Skill> _skills=[];
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._yearsOfExperience,this._skills, this._address);

  // Named constructor for mobile developer
  Employee.mobileDeveloper(String name, double baseSalary, int yearsOfExperience, Address address)
      : _name = name,
        _baseSalary = baseSalary,
        _yearsOfExperience = yearsOfExperience,
        _address = address,
        _skills = [Skill.FLUTTER, Skill.DART];

  Employee.itSupport(String name, double baseSalary, int yearsOfExperience, Address address)
      : _name = name,
        _baseSalary = baseSalary,
        _yearsOfExperience = yearsOfExperience,
        _address = address,
        _skills = [Skill.OTHER];

  String get name=> _name;
  num get baseSalary=> _baseSalary; 
  int get yearsOfExperience=> _yearsOfExperience;
  // Address get address=> _address;
  List<Skill> get skills => _skills;

  void printDetails() {
    print('Employee: $name, Address: ${_address} \nBase Salary: ${_baseSalary}\$');
  }
  num computeSalary(){
    //yearsOfExperience
  num salary= baseSalary;
   salary += (yearsOfExperience *2000);
   
  //Skills
  for(var skillBonus in skills){
    if(skillBonus== Skill.FLUTTER){
      salary+=5000;
    }
    else if(skillBonus== Skill.DART){
      salary+=3000;
    }
    else if(skillBonus== Skill.OTHER){
      salary+=1000;
    }
  }
  return salary;
}
}


void main() {
  //createe address object
  var add1= Address('CADT street','PP',000001);
  var add2= Address('IFL street','PP',000002);
  var add3= Address('AUPP street','PP',000003);
  //create emplyee object
  var emp1 = Employee('Sokea', 40000,3,[Skill.OTHER],add1);
  emp1.printDetails();
  print("Total Salary: ${emp1.computeSalary()}\$");

  var emp2 = Employee('Ronan', 45000,5,[Skill.FLUTTER,Skill.DART],add2);
  emp2.printDetails();
  print("Total Salary: ${emp2.computeSalary()}\$");
  var emp3 = Employee('Thida', 50000,5,[Skill.FLUTTER,Skill.DART,Skill.OTHER],add3);
  emp3.printDetails();
  print("Total Salary: ${emp3.computeSalary()}\$");

}