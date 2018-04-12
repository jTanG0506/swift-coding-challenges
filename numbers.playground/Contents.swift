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
