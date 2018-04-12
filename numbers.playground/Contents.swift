// Chapter 2 - Numbers

import Cocoa

// Challenge 16
// Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
func challenge16() {
  for i in 1...100 {
    print(i % 15 == 0 ? "Fizz Buzz" : i % 3 == 0 ? "Fizz" : i % 5 == 0 ? "Buzz" : "\(i)")
  }
}

// Challenge 17
// Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.
func challenge17(min: Int, max: Int) -> Int {
  return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

// Challenge 18
// Create a function that accepts positive two integers, and raises the first to the power of the second.
func challenge18(base: Int, power: Int) -> Int {
  guard base > 0, power > 0 else { return 0 }
  if power == 1 { return base }
  
  return base * challenge18(base: base, power: power - 1)
}

// Challenge 19
// Swap two positive variable integers, a and b, without using a temporary variable.
func challenge19(a: Int, b: Int) -> (Int, Int) {
  return (b, a)
}

// Challenge 20
// Write a function that accepts an integer as its parameter and returns true if the number is prime.
func challenge20(number: Int) -> Bool {
  guard number >= 2 else { return false }
  guard number != 2 else { return true }
  
  let upperBound = Int(ceil(sqrt(Double(number))))
  for i in 2...upperBound {
    if number % i == 0 {
      return false
    }
  }
  
  return true
}
