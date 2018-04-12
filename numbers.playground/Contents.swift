// Chapter 2 - Numbers

import Cocoa

// Challenge 16
// Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
func challenge16() {
  for i in 1...100 {
    print(i % 15 == 0 ? "Fizz Buzz" : i % 3 == 0 ? "Fizz" : i % 5 == 0 ? "Buzz" : "\(i)")
  }
}
