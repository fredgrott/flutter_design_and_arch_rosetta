void main(List<String> arguments) {
  // ignore: omit_local_variable_types
  int amount1 = 100;
  var amount2 = 200;

  print('Amount1: $amount1 | Amount2: $amount2 \n');

  // ignore: omit_local_variable_types
  double dAmount1 = 100.11;
  var dAmount2    = 200.22;

  print('dAmount1: $dAmount1 | dAmount2: $dAmount2 \n');

  // ignore: omit_local_variable_types
  String name1 = 'Mahmud';
  var name2    = 'Ahsan';

  print('My name is: $name1 $name2 \n');

  // ignore: omit_local_variable_types
  bool isItTrue1 = true;
  var isItTrue2  = false;
  
  print('isItTrue1: $isItTrue1 | isItTrue2: $isItTrue2 \n');

  dynamic weakVariableOne = 100;
  print('WeakVariable 1: $weakVariableOne \n');

  var weakVariableTwo = 'Dart Programming';
  print('WeakVariable 2: $weakVariableTwo');

}
