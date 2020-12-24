import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'dart:math';

void main()
{
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(int.parse('0x42') is int);
  assert(int.parse('42', radix: 16) == 66);
  assert(42.toString() == '42');
  assert(12.34.toString() == '12.34');
  print("${123.456.toStringAsFixed(2)}"); // 小数点后有多少位
  print("${123.456.toStringAsPrecision(2)}"); // 包括小数点显示多少位 1.2e+2
  print("${double.parse('1.2e+2')}");
  testString();
  testArray();
  testUri();
  testDate();
  testAsync();
  testMath();
  testConvert();
}

void testString() {
  print("=====testString()======");
  const str = 'Never odd or even';
  print("${str.contains("odd")}");
  print("${str.startsWith("Never")}");
  print("${str.endsWith("even")}");
  print("${str.indexOf("even")}");
  print("${str.split(" ")}"); // 按空格拆分
  print("${str.split("")}"); // 拆分所有字符
  print("${str.substring(3, 8)}");
  print("${str.codeUnits}"); // ascii对应int数值
  print("${str.toUpperCase()}"); // 全部转换为大写
  print("${str.toLowerCase()}"); // 全部转换为小写
  print("${" www  ".trim()}"); // 去掉前后空格
  print("${str.replaceAll(RegExp("or"), "and")}"); // 去掉前后空格
  
  var sb = StringBuffer();
  // 组合字符串, writeAll第二个参数是指定分隔符
  sb..write("You are ")..writeAll(["beautiful", "cute", "attractive"], " ")..write(".");
  print(sb.toString());

  const str2 = "You are 15 or 16 years old.";
  var numReg = RegExp(r"\d+");
  print(str2.contains(numReg)); // 表达式判断是否包含
  print(str2.replaceAll(numReg, "00")); // 表达式替换
  print(numReg.hasMatch(str2)); // 检测是否匹配
  for(var match in numReg.allMatches(str2)) { // 迭代所有匹配的对象
    print(match.group(0));
  }
}

void testArray() {
  print("=======testArray()======");
  var fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort((a, b) => a.compareTo(b)); // 排序
  print(fruits);
  var set1 = {"123", "456", "789"};
  var set2 = {"333", "456", "999"};
  print(set1.intersection(set2)); // 两个集合的交集
  var map1 = {123: "123", 234: "234"};
  var map1_keys = map1.keys;
  print(Set.from(map1_keys).contains(123));
  print("containsKey: ${map1.containsKey(123)}");
  var map1_values = map1.values;
  print(map1_values.any((element) => element.contains("123")));
  map1.putIfAbsent(666, () => "666"); // 不存在则插入
  map1.putIfAbsent(666, () => "888"); // 存在则不处理
  print(map1);
  map1.forEach((key, value) => print("key: $key, value: $value"));
  print(map1.map((key, value) => MapEntry(key, value.substring(0, 1))));

  print(fruits.where((element) => element.contains('b'))); // 过滤条件, 并返回符合条件的Iterable.
  print(fruits.any((element) => element.contains('b'))); // 过滤条件, 返回true false.
  print(fruits.every((element) => element.contains('b'))); // 是否所有条件都满足, 返回true false.
  // page 8.
}

void testUri() {
  print("=======testUri()======");
  var url = 'http://pananfly.com/test?login=panan fly&pwd=123456';
  var uriEncoded = Uri.encodeFull(url);
  print(uriEncoded);
  var uriDecoded = Uri.decodeFull(uriEncoded);
  print(uriDecoded);
  var uriComponentEncoded = Uri.encodeComponent(url);
  print("Uri encode component: $uriComponentEncoded.");
  var uriComponentDecoded = Uri.decodeComponent(uriComponentEncoded);
  print("Uri decode component: $uriComponentDecoded.");
  var uri = Uri.parse(url);
  print("Uri scheme: ${uri.scheme}, host: ${uri.host}, path: ${uri.path}, fragment: ${uri.fragment}, origin: ${uri.origin}");
  var uri2 = Uri(scheme: 'https', host: 'pananfly.com', path: 'login', fragment: '999');
  print("Construct uri: $uri2");

  // page 9.
}

void testDate() {
  print("=======testDate()======");
  print("Now time: ${DateTime.now()}");
  print("2000: ${DateTime(2000, 1, 2)}");
  print("2000 utc: ${DateTime.utc(2000)}");
  print("time from ms utc: ${DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true)}");
  print("time from parse: ${DateTime.parse('2000-01-01T00:00:00Z')}");
  print("Count of ms from 1970.1.1 to 2000.1.1: ${DateTime.utc(2000).millisecondsSinceEpoch}"); // 自公元1970.1.1 以来的毫秒数
  print("Count of ms from 1970.1.1 to 1970.1.1: ${DateTime.utc(1970).millisecondsSinceEpoch}"); // 0
  var time1 = DateTime.utc(2000);
  print("Time add 366 days: ${time1.add(const Duration(days: 366))}");
  print("Time subtract 30 days: ${time1.subtract(const Duration(days: 30))}");
  var duration = DateTime.now().difference(time1);
  print("Difference duration days: ${duration.inDays}, hours: ${duration.inHours}, seconds: ${duration.inSeconds}");

}

class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  @override
  // TODO: implement hashCode
  int get hashCode { // 重写hashCode
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName;
}

class Process { }

class ProcessIterator implements Iterator<Process> {
  @override
  // TODO: implement current
  Process get current => throw UnimplementedError();

  @override
  bool moveNext() {
    // TODO: implement moveNext
    throw UnimplementedError();
  }
}

class Processes extends IterableBase<Process> {
  @override
  // TODO: implement iterator
  Iterator<Process> get iterator => ProcessIterator();
}

void testIterator() {
  for(var process in Processes()) {
  }
  // page 12.
}

Future costlyQuery(String url) async{
  return url;
}

Future expensiveWork(String value) async{
  return value + "_expensive";
}

void testAwait() async {
  var query = await costlyQuery("https://666.com");
  var expensive = await expensiveWork(query);
  print("testAwait: $expensive");

  await Future.wait([costlyQuery("https://77777.com"), expensiveWork("1122334455")]);
  String path = "";
  if(FileSystemEntity.isDirectorySync(path)) {
    final startingDir = Directory(path);
    await for (var entity in startingDir.list()) {
      if(entity is File) {
        // search file
      }
    }
  } else {
    // search file
  }

  // querySelector("").onClick.listen((event) { })
}

void testStream() async {
  var config = File('/Users/pananfly/Documents/flutter/README.md');
  Stream<List<int>> inputStream = config.openRead();
  var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      print("Got line: $line");
    }
  } catch (e, s) {
    print("Stream error: $e");
  }
  print("***********");
  inputStream = config.openRead(); // need to reopen.
  inputStream.transform(utf8.decoder).transform(LineSplitter()).listen((event) {
    print("line: $event");
  }, onDone: () {
    print('File is now close');
  }, onError: (e) {
    print("Stream error2: $e");
  });
}

void testAsync() {
  print("======testAsync() enter======");
  testAwait();
  print("++++++++++++++++");
  Future result = costlyQuery("https://pananfly.com");
  result.then((value) => expensiveWork(value))
        .then((value) => print("Filter $value."))
        .then((_) => print("Done..."))
        .catchError((exception) {

  });
  print("++++++++++++++++");
  testStream();
  print("======testAsync() end======");
}

void testMath() {
  print("=========testMath()=========");
  print("cos(pi): ${cos(pi)}");
  print("sin(): ${sin(30 * pi / 180)}");
  print("abs(): ${(sin(30 * pi / 180) - 0.5).abs()}");
  print(max(1, 1000));
  print(min(1, -1000));
  print("e: $e");
  print("pi: $pi");
  print("sqrt(2): ${sqrt(2)}");
  var random = Random();
  print("Random nextDouble: ${random.nextDouble()}"); // [0, 1)
  print("Random nextInt: ${random.nextInt(10)}"); // [0, 9]
  print("Random nextBool: ${random.nextBool()}"); // true or false
}

void testConvert() {
  print("========testConvert()========");
  var json = '''
  [
    {"score": 50},
    {"score": 60}
  ]
  ''';
  var scores = jsonDecode(json);
  print("runtimeType: ${scores.runtimeType}, data: $scores"); // List
  print("runtimeType 2: ${scores[0].runtimeType}, data: ${scores[0]}, data2: ${scores[0]['score']}"); // _InternalLinkedHashMap
  List<int> utf8Bytes = [
    0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9, 0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3, 0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4, 0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
  ];
  print("UTF-8 decode: ${utf8.decode(utf8Bytes)}");
  print("UTF-8 encode: ${utf8.encode("Îñţérñåţîöñåļîžåţîờñ")}"); // dart 字符串编码为utf-8
}

