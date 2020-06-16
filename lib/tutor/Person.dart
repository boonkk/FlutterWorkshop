class Person {
  int _age;
  String _name;

  Person(this._age, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}