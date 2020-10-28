

import 'package:meta/meta.dart';

void main() {
  testParam();
  testFunc2();
  testCalculate();
  testArray();
}

bool isNoble(int num) {
  return num != null;
}

bool isNoble2(int num) => num != null; // 只有一句表达式可以简写, => 是{ return expr; } 的简写
// bool isNoble3(int num) => if(num != null) true else false ; // 错误

// 可选参数, 参数默认值用=号, 旧版用:号以后将不支持
void setFlags({bold = true, hidden = false, int size}) {
  print("setFlags: $bold, $hidden, $size.");
}

// 可选中有@required 必须传, @required 定义在package:meta/meta.dart包中
void setFlags2(int i, {int age, @required bool flag}) {
  print("setFlags2: $age, $flag.");
}

// 位置可选参数
void setFlags3(String msg, [String warm]) {
  print("setFlags3: $msg, $warm");
}
// 位置可选参数-默认值
void setFlags4(String msg, [String warm = "666", String err]) {
  print("setFlags4: $msg, $warm, $err");
}

// 可选参数List和Map默认值
void doStuff(
    {List<dynamic>list = const [1, 2, 3],
     Map<String, String> gifts = const {
      "fadf": "fdsafs",
      "45678": "ghbnjtr"
     }}
    ) {

}
void testParam() {
  setFlags(bold: false, hidden: false, size: 2);
  setFlags2(1,flag: false);
  setFlags3("fdaf", "1111");
  setFlags3("4thuj");
  setFlags4("7890");
  int i = 0;
  i.sign.sign; // 级联操作
}

void printElement(int element) {
  print(element);
}

void testFunc() {
  var list = [1, 2, 3];
  list.forEach(printElement); // 函数是一等对象，可以作为另一个函数的参数

  var loudify = (String msg) => '== ${msg.toUpperCase()} =='; // 可以将函数赋值给一个值
  var loudify2 = (String msg) {  return '== ${msg.toUpperCase()} ==';  }; // 可以将函数赋值给一个值
  loudify("fdasfadsf");
}

// 闭包 返回一个函数
Function makeAdder(num add) {
  return (num it) => add + it;
}

void testFunc2() {
  var add2 = makeAdder(2);
  print("testFunc2 add2(3): ${add2(3)}");
}
class Second{
  String name;
}
class Person{
  String firstName;
  Second second;
}
Person getPerson() {
  return Person();
}
void testCalculate() {
  print("testCalculate 5 / 2 = ${5 / 2}." ); // 2.5 双浮点型
  print("testCalculate 5 ~/ 2 = ${5 ~/ 2}." ); // 2 返回整形

  int i;
  if(i is Object) { // 判断类型

  }
  Object obj = Person();
  (obj as Person).firstName = "fdafd";

  int b;
  b ??= 123; // 当b为null时赋值，否则保持不变
  print("testCalculate b = $b");

  // .. 级联运算符, 获取的是同一个对象进行操作, 不用创建临时变量
  getPerson()..second = Second()
            ..second?.name = "123456"
            ..firstName = "99999"
            ..second?.name?.toUpperCase();
}

String playName(String name) => name ?? "Unknown"; // name不为null时返回本身, 否则返回后面的值

void testArray() {
  print("===testArray===");
  var collection = [0, 1, 2];
  for(var i in collection) {
    print(i);
  }
  print("====1====");
  collection.where((element) => element > 0).forEach((element) => print(element));
}

void testSwitch(int i) {
  switch(i) {
    case 1:
      break;
    // case 2: // 不能省略break;
    //   i / 2 ;
    case 3:
      break;
    case 4:
    case 5:
      // 可以两个条件一起
      break;
    case 6:
      i / 3;
      continue toSeven; // 可以指定跳转到哪里继续执行
    toSeven:
    case 7:
      break;
  }
}

void testThrow() {
  int i = 10;
  if(i == 5) {
    throw FormatException("fdafasdf");
  }

  if(i == 6) {
    // 抛出任意异常
    throw 'fjldsajflj';
  }

  try {

  } on OutOfMemoryError {
    // 特定的异常
  } on Exception catch(e) {
    // 其他任何异常
  } catch(e, s) {
    // 没有指定类型，捕获所有异常
    // s是堆栈信息
    rethrow; // 重新将异常抛出
  } finally {
    // 最终都会执行
  }

  // page 26
}