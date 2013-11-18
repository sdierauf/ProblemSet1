//Stefan Dierauf Nov 2013
//solutions to problem set 1 from sudo soldiers


//find the sum of all the multiples of 3 and 5 below 1000
var problem1 = function() {
  var sum = 0;
  for (var i = 1; i < 1000; i++) {
    if (i % 3 == 0) {
      sum += i;
    } else if (i % 5 == 0) {
      sum += i;
    }
  }
  console.log("The sum of all the multiples of 3 and 5 below 1000 is: " + sum);
}

problem1();

//find the sum of all the even fibbonaci numbers below 4000000
var problem2 = function() {
  var max = 4000000
  var sum = 0;
  var getNthFibbonaci = function(num) {
    if (num == 1 || num == 0) {
      return num;
    } else {
      return getNthFibbonaci(num - 1) + getNthFibbonaci(num - 2);
    }
  }

  var counter = 1;
  var fib = getNthFibbonaci(counter);
  while (fib < max) {
    if (fib % 2 == 0) {
      sum += fib;
    }
    counter++;
    fib = getNthFibbonaci(counter);
  }

  console.log("The sum of all even fibbonaci numbers below " + max + " is: " + sum );
}

problem2();

var betterProblem2 = function() {
  var max = 4000000
  var sum = 0;
  var fib = 0;
  var a = 0;
  var b = 1;
  while (fib < max) {
    if (a < b) {
      a = a + b;
      fib = a;
    } else {
      b = a + b;
      fib = b;
    }
    if (fib % 2 == 0) {
      sum += fib;
    }
  }
  console.log("Yee faster The sum of all even fibbonaci numbers below " + max + " is: " + sum);
}

betterProblem2();

//what is the largest prime factor of 600851475143 (a: 6875)
//really inefficient
var problem3 = function() {
  var largestPrime = 2;
  var max = 600851475143;
  //factor checker
  //prime checker
  var isPrime = function(num) {
    for (var i = 2; i < num / 2; i++) {
      if (num % i == 0) {
        return false;
      }
    }
    return true;
  }

  for (var j = 2; j < max / 2; j++) {
    if (max % j == 0) {
      if (isPrime(j)) {
        if (j > largestPrime) {
          largestPrime = j;
          console.log("New largest prime found: " + j);
        }
      }
    }
  }
  console.log("The largest prime factor of " + max + " is " + largestPrime);
}

//problem3(); //commented out because slow


//largest palindrome made from 2 2digit numbers is 9009 = 91 * 99, 
//what is the largest made from 2 3digit numbers (a: 906609)
var problem4 = function() {
  String.prototype.first = function() { return this.charAt(0); };
  String.prototype.last = function() { return this.charAt(this.length - 1); };
  var isPalindrome = function(numString) {
    if (numString.length < 2) {
      return true;
    } else {
      return (numString.first() == numString.last()) && 
        isPalindrome(numString.slice(1, numString.length - 1));
    }
  }

  var largest = 0;
  for (var i = 100; i < 1000; i++) {
    for (var j = 100; j < 1000; j++) {
      var product = i * j;
      if (isPalindrome(product + "")) {
        if (product > largest) {
          largest = product;
        }
      }
    }
  }
  console.log("The largest palindrome made from two 3 digit numbers is: " + largest);
}

problem4();


//find the smallest number divisible by the numbers from 1 to 20 without a remainder
var problem5 = function() {
  var max = 20;
  var answer = max;
  var hasRemainder = function(num) {
    for (var i = 1; i < max; i++) {
      if (num % i != 0) {
        return false;
      }
    }
    return true;
  }

  while (!hasRemainder(answer)) {
    answer++;
  }

  console.log("The smallest number divisible by the numbers from 1 to " + max + " is " + answer);
}

problem5();

