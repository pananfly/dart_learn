import 'dart:async';
import 'package:dart_learn/dart-1.dart'; // 引入库
import 'package:dart_learn/dart-2.dart' as dart2; // 指定库前缀
import 'package:dart_learn/dart-2.dart' show testThrow; // 导入库的一部分
import 'package:dart_learn/dart-2.dart' hide testSwitch; // 隐藏库的一部分
// import 'package:dart_learn/dart-3.dart' deferred as dart3; // 延迟加载库

void main() {
  dart2.Person p = dart2.Person();
  greet();
  print("6666");
  testCallClass();
}

Future greet() async {
  // await dart3.loadLibrary();
  // print(dart3.greetBob(dart3.Person('fdaf')));
  String data = null;
  try {
    data = await testSync();
  }catch (e, s) {
    // 捕获安全
  }
  print(data);

  print(await getVersion()); // 调用必须加await
}

  testSync() async {
    return await "fdafa";
  }

  Future<String> getVersion() async => "1.0.0";

// 生成器
Iterable<int> naturalsTo(int n) sync* { // sync* 返回一个Iterable对象
  int k = 0;
  while(k < n) yield k++;
}

Iterable<int> naturalsTo2(int n) sync* { // 如果是递归的，使用yield*提高性能
  if(n > 0) {
    yield n;
    yield* naturalsTo2(n - 1);
  }
}

Stream<int> asyncnaturalsTo(int n) async* { // async* 返回一个Stream对象
  int k = 0;
  while(k < n) yield k++;
}

void testCallClass() {
  var clazz = CallClass();
  // 使用类调用call方法, 让类像函数一样调用
  int ret = clazz("1", "2", "3");
  print("call class, ret: $ret ." );
  // page 45.
}

class CallClass {
  int call(String a, String b, String c) {
    return 6666;
  }
}

