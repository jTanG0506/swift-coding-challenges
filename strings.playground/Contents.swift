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

// Challenge 5
// Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
// Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
func challenge5(char: Character, str: String) -> Int {
  return str.reduce(0) {
    $1 == char ? $0 + 1 : $0
  }
}

assert(challenge5(char: "a", str: "The rain in Spain") == 2, "Challenge 5 failed")
assert(challenge5(char: "i", str: "Mississippi") == 4, "Challenge 5 failed")
assert(challenge5(char: "i", str: "Hacking with Swift") == 3, "Challenge 5 failed")

// Challenge 6
// Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.
// Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
func challenge6(str: String) -> String {
  var used = [Character]()
  
  for letter in str {
    if !used.contains(letter) {
      used.append(letter)
    }
  }
  
  return String(used)
}

assert(challenge6(str: "wombat") == "wombat", "Challenge 6 failed")
assert(challenge6(str: "hello") == "helo", "Challenge 6 failed")
assert(challenge6(str: "Mississippi") == "Misp", "Challenge 6 failed")

// Challenge 7
// Write a function that returns a string with any consecutive spaces replaced with a single space.
func challenge7(str: String) -> String {
  return str.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

assert(challenge7(str: "a   b   c") == "a b c", "Challenge 7 failed")
assert(challenge7(str: "    a") == " a", "Challenge 7 failed")
assert(challenge7(str: "abc") == "abc", "Challenge 7 failed")

// Challenge 8
// Write a function that accepts two strings, and returns true if one string is rotation of the other, taking letter case into account.
func challenge8(str1: String, str2: String) -> Bool {
  return str1.count == str2.count && "\(str1)\(str1)".contains(str2)
}

assert(challenge8(str1: "abcde", str2: "eabcd") == true, "Challenge 8 failed")
assert(challenge8(str1: "abcde", str2: "cdeab") == true, "Challenge 8 failed")
assert(challenge8(str1: "abcde", str2: "abced") == false, "Challenge 8 failed")
assert(challenge8(str1: "abc", str2: "a") == false, "Challenge 8 failed")

// Challenge 9
// A pangram is a string that contains every letter of the alphabet at least once. Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.
func challenge9(str: String) -> Bool {
  let set = Set(str.lowercased())
  let letters = set.filter { $0 >= "a" && $0 <= "z" }
  return letters.count == 26
}

assert(challenge9(str: "The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed")
assert(challenge9(str: "The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed")

