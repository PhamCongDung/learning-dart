abstract class Animal {
  void speak();

  void move();
}

class Dog extends Animal {
  @override
  void speak() => print("Woof");

  @override
  void move() => print("Run");
}

class Fish extends Animal {
  @override
  void speak() => print("Blop");

  @override
  void move() => print("Swim");
}

void main() {
  var scoobidoo = Dog();
  scoobidoo.speak();
  scoobidoo.move();
  var shark = Fish();
  shark.speak();
  shark.move();
}
