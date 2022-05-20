import 'package:flutter/cupertino.dart';

void main() {
  int i = 0;
  Type type = i.runtimeType; // 运行时类型
  print("type is $type.");

  var p = Point(null, null);
  type = p.x.runtimeType;
  print("Point x's type is $type."); // Null
  p.x = 1.9;
  type = p.x.runtimeType;
  print("Point x's type 2 is $type."); // double
  p.x = 1;
  type = p.x.runtimeType;
  print("Point x's type 3 is $type."); // int

  var p2 = Point.fromMap({'x': 1, 'y': 2.0});
  print("P2 x: ${p2.x}, y: ${p2.y}");

  var p3 = Point.alongXAxis(2);
  print("P3 x: ${p3.x}, y: ${p3.y}");

  var r1 = Rectangle(1, 2);
  r1 = Rectangle(2, 3); // 常量构造函数生成的实例不总是常量
  // Rectangle.origin = r1; // 不允许

  var logger = Logger("LLLL");
  logger.log("1234567890");
  logger = Logger._internal("fdsafasd");
  logger._priFunc();
  logger.log("999999");

  print(greetBob(Person("pananfly")));
  print(greetBob(Impostor()));
}

class Point {
  num? x; // 声明变量x, 初始值为null
  num? y;
  num? z = 0; // 声明变量z, 初始化是0

  // Point(); // 空的默认构造函数

  Point(num? x, num? y) {
    // 如果存在默认构造函数，这里会报错，并且不能同时存在两个构造函数
    this.x = x;
    this.y = y;
    print("Point(num x, num y)");
  }

  // Point(this.x , this.y); // 简化的构造函数

  // 构造函数执行前，通过初始列表设置实例变量(但我也没看到有调构造函数啊。。。)
  Point.fromMap(Map<String, num> map)
      : x = map['x'],
        y = map['y'] {
    // 不会去调用构造函数
    print("Point.fromMap(Map<String, num> map)");
  }

  // 重定向构造函数不能有body
  Point.alongXAxis(num x) : this(x, 0);
  // {
  //   print("Point.alongXAxis(num x) : this(x, 0)");
  // }
}

class Circle extends Point {
  // 继承
  Circle(num x, num y) : super(x, y) {
    // 调用父类构造函数
    print("Circle(num x, num y)");
  }
}

class Rectangle {
  // 静态常量
  static final Rectangle origin = const Rectangle(0, 0);
  final num x, y;
  // 常量构造函数，所有变量必须是final
  const Rectangle(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{}; // _开头的是私有属性

  factory Logger(String name) {
    // 工厂构造函数无法访问this
    dynamic logger = _cache[name] ?? Logger._internal(name);
    _cache[name] = logger;
    return logger;
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print("$name: $msg");
    }
  }

  void _priFunc() {
    print("$name: _priFunc()");
  }
}

class Oval {
  num radius;

  Oval(this.radius);

  // get和set函数
  num get perimeter => radius * 2;
  set perimeter(num value) => radius = value / 2;
}

// 抽象类
abstract class Doer {
  void doSomething();
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}

// 隐式接口
class Person {
  final _name;

  Person(this._name);

  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Impostor implements Person {
  @override
  String greet(String who) => 'Hi $who, do you know who I am?';

  @override
  get _name => 'Impostor';
}

String greetBob(Person person) => person.greet('Bob');

class Vector {
  final int x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y); // 重写运算符

  @override
  noSuchMethod(Invocation invocation) {
    // 当代码尝试使用不存在的方法或者实例变量时，通过重写本方法来实现检测和应对
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

enum Color { red, green, blue } // 索引从0开始

void testEnum() {
  assert(Color.red.index == 0);
  List<Color> colors = Color.values;
  var aColor = Color.red;
  switch (aColor) {
    case Color.red:
      break;
    case Color.blue:
      break;
  }
}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;
  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

// 使用with实现Mixin
class Musician extends Person with Musical {
  Musician(name) : super(name) {
    canConduct = true;
  }

  void play() {}
}

mixin MusicalPerformer on Musician {}

// 指定只有某些类型可以使用的 Mixin - 比如， Mixin 可以调用 Mixin 自身没有定义的方法 - 使用 on 来指定可以使用 Mixin 的父类类型
// with 可以跟多个
class MusicalBBB extends Musician with MusicalPerformer, Musical {
  @override
  late bool canCompose;

  @override
  late bool canConduct;

  @override
  late bool canPlayPiano;

  MusicalBBB(name) : super(name);

  static const initialType = 0xAAA; // 静态变量只有在使用的时候才会初始化

  static void playTrump() {
    // 类名直接调用
  }
}

void testMusician() {
  var m = Musician("fdaf");
  m.entertainMe();
  // var mp = MusicalPerformer();
  var bbb = MusicalBBB("fdsaf");
  bbb.play();
  bbb.entertainMe();
  bbb.greet("fdsafs");

  MusicalBBB.playTrump();
}

void testGeneric() {
  var foo = Foo<FooExtend>();
  var foo2 = Foo<FooBase>();
  var foo3 = Foo(); // 不指定
}

class FooBase {}

class FooExtend extends FooBase {}

// 限制范型类型
class Foo<T extends FooBase> {
  T plus<T>(List<T> ts) {
    T tmp = ts[0];
    return tmp;
  }
}

// page 41