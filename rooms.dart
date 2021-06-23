import 'dart:core';

import 'dart:io';

int accountBalance = 10000; // To be update with withdraw and deposit function
String name = "$name";
String emailAddress = "$emailAddress";
String gender = "$gender";
String country = "$country";
String favoriteFood = "$favoriteFood";
String hobby = "$hobby";
String friend = "$friend";
String favoriteCar = "$favoriteCar";
int age = age;
int newBalance = newBalance;

void getUserInformation() {
  while (true) {
    // get user's name
    name = getUserResponse('Enter your name');

    // get user's email address
    emailAddress = getUserResponse('Enter your email address');

    // get user gender
    gender = getUserResponse('Enter your gender');

    // get user's country
    country = getUserResponse('Enter your country');

    // get user's favorite food
    favoriteFood = getUserResponse('Enter your favorite food');

    // get user's hobby
    hobby = getUserResponse('Enter your hobby');

    // get user's friends
    friend = getUserResponse("Enter your friends' name");

    // get user's favorite car
    favoriteCar = getUserResponse('What is your favorite car');

    // get user's age
    age = getUserAge();

    updateUserAccountBalance();

    printResults();

    exit(0);
  }
}

String getUserResponse(String question) {
  stdout.write('$question: \n');
  return question;
}

/// returns a list of foods from a string of foods separated by space
List<String> getFavoriteFoods(String favoriteFoodString) {
  return favoriteFoodString.split(' ');
}

var retries = 3;
int getUserAge() {
  stdout.write('Enter your age: \n');
  var response = stdin.readLineSync();
  int age;
  try {
    age = int.parse(response.toString());
    return age;
  } catch (e) {
    if (retries > 0) {
      retries -= 1;
      print('Invalid age, you have $retries retries left');
      return getUserAge();
    } else {
      print(
          'Invalid, you have used all your retries, your age wont be captured');
    }
  }
  return getUserAge();
}

void printResults() {
  print('\n');
  print('**********Results*************');
  print('Your name is $name');
  print('Your email address is $emailAddress');
  print('Your gender is $gender');
  print('Your country is $country');
  print('Your favorite Food is $favoriteFood');
  print('Your hobby is $hobby');
  print('Your friend is $friend');
  print('Your favorite Car is $favoriteCar');
  print('Your age is $age');
  print('Your account balance is $accountBalance');
  print('*********Results**************');
  print('');
}

void updateUserAccountBalance() {
  var response = getUserResponse('Do you want to use your account(Yes/No)?');

  if (response != getUserResponse("yes")) {
    if (response.toLowerCase() == 'yes') {
      var answer1 = getUserResponse(
          'Do you want to deposit or withdraw from your account(deposit/withdraw)?');
      if (answer1 != "deposit" && answer1.toLowerCase() == 'deposit') {
        deposit();
      } else if (answer1 != 'withdraw' && answer1.toLowerCase() == 'withdraw') {
        withdraw();
      } else {
        print('$answer1 is not one of the options');
      }
    } else {
      print('You decided not to use your account');
    }
  } else {
    print('You did not input anything');
  }
}

void deposit() {
  //var depositAmount = getUserResponse('How much do you want to deposit?');
  accountBalance = int.parse(accountBalance.toString());
  //newBalance = depositAmount + accountBalance;

  print("The new balance is $newBalance");
  return deposit();
}

void withdraw() {
  var withdrawAmount = getUserResponse('How much do you want to $withdraw?');

  if (withdrawAmount == ("$newBalance")) {
    print("you have withdrawn $withdrawAmount");
  }
  print("The new balance is $newBalance");
  return withdraw();
}
