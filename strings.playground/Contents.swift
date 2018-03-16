// Chapter 1 - Strings

import Cocoa

// Challenge 1
// Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
func challenge1(input: String) -> Bool {
  return Set(input).count == input.count
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")

// Challenge 2
// Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.
func challenge2(input: String) -> Bool {
  return input.lowercased() == String(input.lowercased().reversed())
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
assert(challenge2(input: "Hello, world") == false, "Challenge 2 failed")

// Challenge 3
// Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
func challenge3(first: String, second: String) -> Bool {
  return first.count == second.count && first.sorted() == second.sorted()
}

assert(challenge3(first: "abca", second: "abca") == true, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "cba") == true, "Challenge 3 failed")
assert(challenge3(first: "a1 b2", second: "b1 a2") == true, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "abca") == false, "Challenge 3 failed")
assert(challenge3(first: "abca", second: "Abc") == false, "Challenge 3 failed")
assert(challenge3(first: "abca", second: "cbAa") == false, "Challenge 3 failed")

// Challenge 4
// Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.
extension String {
  func fuzzyContains(_ str: String) -> Bool {
    return range(of: str, options: .caseInsensitive) != nil
  }
}

assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")

