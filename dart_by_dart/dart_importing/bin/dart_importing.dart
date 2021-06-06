import 'dart:io';

void main(List<String> arguments) {
  stdout.writeln('What is your name: ?');
  // ignore: omit_local_variable_types
  String? name = stdin.readLineSync();
  print('My name is: $name');

}
