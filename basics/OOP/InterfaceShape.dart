abstract class Shape {
  double area();
}

class Rectangle implements Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);
  @override
  double area() => width * height;
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
  @override
  double area() => 3.14159 * radius * radius;
}

void main() {
  var shape_a = Rectangle(12, 2.5);
  var shape_b = Circle(1.2);
  print("Area shape a : ${shape_a.area()}");
  print("Area shape b : ${shape_b.area()}");
}
