library todo;
// 元数据可以在 library、 class、 typedef、 type parameter、 constructor、 factory、 function、 field、 parameter 或者 variable 声明之前使用，
// 也可以在 import 或者 export 指令之前使用。 使用反射可以在运行时获取元数据信息。
class Todo {
  final String who;
  final String what;
  const Todo(this.who, this.what);
}