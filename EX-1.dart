enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;
  Address(this.street, this.city, this.zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearOfExperience;

  Employee({
    required this._name,
    required this._baseSalary,
    required this._address,
    required this._skills,
    required this._yearOfExperience,
  });

  String get name => this._name;
  double get baseSalary => this._baseSalary;
  List get skills => this._skills;
  Address get address => this._address;
  int get yearOfExp => this._yearOfExperience;

  void printDetails() {
    print('Employee: $_name \n\tBase Salary: \$${_baseSalary}');
    print("\tEach year of Exp adds \$2000");
  }
  void computeSalary() {
    double total = this._baseSalary;
    // each year of exp add 2000
    total += 2000 * _yearOfExperience;

    for (Skill s in _skills) {  
      switch (s) {
        case Skill.DART:
          total += 3000;
          break;
        case Skill.FLUTTER: 
        total +=5000; break;
        case Skill.OTHER: 
        total += 1000;
      }
      
    }
    print("Employee name: $_name\n\tTotal Salary: $total");
  }
}

void main() {
  var emp1 = Employee(
    name: 'Sokea',
    baseSalary: 40000,
    address: Address('123 Main St', 'Phnom Penh', 12258),
    skills: [Skill.FLUTTER, Skill.DART],
    yearOfExperience: 3,
  );
  emp1.printDetails();

  var emp2 = Employee(
    name: 'Ronan',
    baseSalary: 45000,
    address: Address('456 Royal St', 'Siem Reap', 17252),
    skills: [Skill.DART, Skill.OTHER],
    yearOfExperience: 5,
  );
  emp2.computeSalary();
}
