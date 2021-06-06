// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  // ignore: unused_local_variable
  var s1 = 'Single quotes work well for string literals.';
  // ignore: prefer_single_quotes
  // ignore: unused_local_variable
  var s2 = "Double quotes work just as well.";
  // ignore: unused_local_variable
  var s3 = 'It\'s easy to escape the string delimiter.';
  // ignore: unused_local_variable
  var s4 = "It's even easier to use the other delimiter.";

  // ignore: unused_local_variable
  var s = r'In a raw string, not even \n gets special treatment.';

  var age = 35;
  var str = 'My age is: $age';
  print(str);

  var s12 = '''
  You can create
  multi-line strings like this one.
  ''';

  var s22 = """This is also a
  multi-line string.""";




}
