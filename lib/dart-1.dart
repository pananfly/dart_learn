import 'package:dart_learn/dart-1.dart';

printInteger(int number) {
  print('The number is $number.');
}

main() {
  // dart 中，一切都是对象
  var num = 42; // 声明并初始化一个变量, 自动推断为int类型
  printInteger(num);
  dynamic num2 = 10; // 特殊类型
  int num3 = 20;
  List <int> list1 = null;
  List <dynamic> list2 = null;

  int count; // 未初始化的默认值为null
  assert(count == null);
  printInteger(count);

  final name = '123'; // final 变量
  final String name2 = "345";

  const bar = 1000;
  var foo = const []; // 等同于List <dynamic>
  final bar2 = const []; // 等同于List <dynamic>
  const bar3 = []; // 等同于List <dynamic>
  // bar3.add("fadfa"); // Cannot add to an unmodifiable list

  foo = [1, 2, 3];
  // bar3 = ["fdas"]; // const 不允许再次赋值

  // 内建类型 Number String Boolean List(Array) Map Set Rune(用于字符串表示Unicode字符) Symbol

  Type_Number();

  Type_String();

  Type_Boolean();

  Type_List();

}

// ignore: non_constant_identifier_names
Type_Number() {
  // -------------
  // Number: int double
  // int-> - 2E63到2E63 -1, 被编译为javascript时- 2E53到2E53 -1
  // double -> 双精度浮点数
  var hex = 0xDEA;
  var yx = 1.1; // 有小数点就是小数类型
  double d1 = 1.0;

  var one = int.parse('1'); // 转换
  var two = double.parse('2');
  var fail = double.tryParse('4s');
  String oneToString = one.toString();
  String piAsString = 3.14159.toStringAsFixed(2); // 保留2位小数点
  assert(piAsString == '3.14');
}

// ignore: non_constant_identifier_names
Type_String() {

  // -------------
  // String 字符串是一组UTF-16单元序列
  var concatStr = 'fdajfadsjlfaj' + 'fdsajfljasdl'; // 通过+号拼接字符串
  var str11 = '''1234
  56''';  // 多行字符串
  var str12 = """78900 fjdslfajl
  fdaf""";
  var rawString = r"fdajlfjasd \n"; // r前缀的字符串为原始raw字符串
  print(rawString); // fdajlfjasd \n  输出原始字符串

  const aConstNum = 0;
  const aConstBoolean = false;
  var aString = "123243432";
  const validConstString = '$aConstNum $aConstBoolean'; // 插值表达式都是const 那结果也是一个const常量
  // validConstString = "fdsafasdlfja"; // 不可再赋值
  // const validConstString2 = "$aConstNum $aString"; // 报错
  var validString3 = "$aConstNum $aString";
  validString3 = "fdafadsf"; // 依旧可变
}

Type_Boolean() {
  var fullName = '';
  bool isEmpty = fullName.isEmpty;
  assert(fullName.isEmpty);
  if(fullName.isEmpty) {

  }
}

Type_List() {
  var list = [1, 2, 3];
  // list.add("123"); // 不允许
  assert(list.length == 3);
  list[0] = 23;

}

Type_Set() {
  var set1 = {'fdsaj', 324, 'fdasf', false}; // 创建set
  set1.add(null);
  var set2 = {1, 2, 34};
  // set2.add("dfad"); // 识别为Set<int>, 不能添加其他类型的数据
  assert(set2.length == 3);

  var elements = <String>{ "123", "456"};
  final constSet = const {'fdsa', "fdaf"}; // 常量Set

}

Type_Map() {
  var gift1 = {1: "fdsa", 2: "fdsafas"}; // map
  var gift2 = Map();
  gift2[123] = "fdsafa"; // 赋值
  var gift3 = new Map(); // new 是可选的
  assert(gift3[23] == null); // 不包含某一项, 获取的值为null

  final constMap = const {1: 123, 2: 666}; // 常量map
}

Type_Rune() {
  // var v1 = \u2665;
}

Type_Symbol() {

  #radix;
  // page 10
}