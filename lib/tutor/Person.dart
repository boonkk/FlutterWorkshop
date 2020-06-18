
    import 'package:flutter/cupertino.dart';

class Person {
      int age;

      static const five = 5;







  String name;
      double height;

      Person({this.age, this.name, this.height});


      Person.from(Person person) {
        this.age = person.age;
        this.name = person.name;
        this.height = person.height;
      }




      countFruits(int applesAmount, int pearsAmount) => applesAmount+pearsAmount;

    }
    void main() {
//   Person person1 = Person(23, "Mark", 1.90);

  Person anotherPerson = Person(age: 23, name: "Mark", height: 1.90);

  var person = Person.from(anotherPerson);

    }



