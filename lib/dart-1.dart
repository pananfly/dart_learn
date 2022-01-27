import 'package:logger/logger.dart';

printInteger(int? number) {
  print('The number is $number.');
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

var logger12 = Logger(
  filter: MyFilter(), // 默认debug才打印，release不打印，需要在VS的output中正常打印需要自定义
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

main() {
  Logger.level = Level.debug;
  // dart 中，一切都是对象
  var num = 42; // 声明并初始化一个变量, 自动推断为int类型
  printInteger(num);
  dynamic num2 = 10; // 特殊类型
  int num3 = 20;
  List<int>? list1 = null;
  List<dynamic>? list2 = null;

  int? count; // 未初始化的默认值为null
  assert(count == null);
  printInteger(count);

  int lineCount; // 定义完不初始化，必须在后面显著初始化

  // printInteger(lineCount); // 非空不初始化不能使用
  if (num3 == 1) {
    lineCount = 1;
  } else {
    lineCount = 2;
  }
  printInteger(lineCount);

  logger12.i("=======");

  late String lateDescription; // 延迟初始化变量
  lateDescription = "123";
  logger12.d("lateDescription: $lateDescription");
  final name = '123'; // final 变量
  final String name2 = "345";

  const bar = 1000;
  var foo = const []; // 等同于List <dynamic>, 常量值
  final bar2 = const []; // 等同于List <dynamic>
  const bar3 = []; // 等同于List <dynamic>
  // bar3.add("fadfa"); // Cannot add to an unmodifiable list

  foo = [1, 2, 3];
  // bar3 = ["fdas"]; // const 不允许再次赋值

  const Object i = 3;
  const list = [i as int]; // 使用类型强转
  logger12.d("list: $list");
  const map = {if (i is int) i: 'int', 5: 0.55};
  logger12.d("map: $map");
  const set = {
    if (list is List<int>) ...list
  }; // ...list 是把list中所有的元素拆开放到别的地方，不加三个点的话是直接放整个集合
  logger12.d("set: $set");
  const set2 = {
    if (list is List<int>) list
  }; // ...list 是把list中所有的元素拆开放到别的地方，不加三个点的话是直接放整个集合
  logger12.d("set2: $set2");

  // 内建类型 Number String Boolean List(Array) Map Set Rune(用于字符串表示Unicode字符) Symbol

  Type_Number();

  Type_String();

  Type_Boolean();

  Type_List();

  Type_Set();

  Type_Map();

  Type_Rune();
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
  double d2 = 1; // 在dart 2.1及之后允许赋值整数
  logger12.d("d1: $d1, d2: $d2"); // 打印都是1.0

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
  56'''; // 多行字符串
  var str12 = """78900 fjdslfajl 
  fdaf""";
  var rawString = r"fdajlfjasd \n"; // r前缀的字符串为原始raw字符串
  print(rawString); // fdajlfjasd \n  输出原始字符串

  const aConstNum = 0;
  const aConstBoolean = false;
  var aString = "123243432";
  const validConstString =
      '$aConstNum $aConstBoolean'; // 插值表达式都是const 那结果也是一个const常量
  // validConstString = "fdsafasdlfja"; // 不可再赋值
  // const validConstString2 = "$aConstNum $aString"; // 报错
  var validString3 = "$aConstNum $aString";
  validString3 = "fdafadsf"; // 依旧可变
  var s3 = 'It\'s easy to escape the string delimiter.'; // 使用单引号时，字符串中有单引号需要转义
  var s4 =
      "It's even easier to use the other delimiter."; // 使用双引号时，字符串中有单引号不需要转义
}

Type_Boolean() {
  var fullName = '';
  bool isEmpty = fullName.isEmpty;
  assert(fullName.isEmpty);
  if (fullName.isEmpty) {}
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}

Type_List() {
  var list = [1, 2, 3];
  // list.add("123"); // 不允许
  assert(list.length == 3);
  list[0] = 23;
  var list2 = const [3, 4, 5];
  // list2[0] = 9; // 编译不通过 Unsupported operation: Cannot modify an unmodifiable list
  var listAppend = [0, ...list2]; // ...扩展操作符
  logger12.d("Append list: $listAppend");
  var listNull;
  var listAppendNull = [1, ...?listNull]; // ...?可空扩展操作符
  logger12.d("Append list null: $listAppendNull");
  var isActive = true;
  var listIf = ['123', if (isActive) '456', '789']; // 在list中判断条件赋值
  logger12.d("If list: $listIf");
  var listOfInts = [9, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i']; // 在list 中使用循环赋值
  logger12.d("For in list: $listOfStrings");
}

Type_Set() {
  var set1 = {'fdsaj', 324, 'fdasf', false}; // 创建set
  // set1.add(null);
  var set2 = {1, 2, 34};
  // set2.add("dfad"); // 识别为Set<int>, 不能添加其他类型的数据
  assert(set2.length == 3);

  var elements = <String>{"123", "456"};
  final constSet = const {'fdsa', "fdaf"}; // 常量Set
  // constSet.add("000"); // 不允许在常量set添加

  Set<String> names = {"123", ...elements, ...?constSet}; // ...扩展跟list类似
  names.add("456");
  names.addAll(elements);
  logger12.d("set names: $names");
}

Type_Map() {
  var gift1 = {1: "fdsa", 2: "fdsafas"}; // map
  var gift2 = Map();
  gift2[123] = "fdsafa"; // 赋值
  var gift3 = new Map(); // new 是可选的
  assert(gift3[23] == null); // 不包含某一项, 获取的值为null

  final constMap = const {1: 123, 2: 666}; // 常量map
  // constMap[666] = 777; // 不允许有修改
  var nobleGases = Map<int, String>();
  nobleGases[6567] = "123";
  var extendMap = {1: "dss", ...gift1, ...?nobleGases}; // ... 扩展与List类似
  logger12.d("extend map: $extendMap");
}

Type_Rune() {
  var v1 = '\u2665'; // 32位unicode
  logger12.d("Type_Rune: $v1");
}

Type_Symbol() {
  #radix;
  // page 10
}
