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

// Challenge 10
// Given a string in English, return a tuple containing the number of vowels and consonants.
func challenge10(str: String) -> (vowels: Int, consonants: Int) {
  let vowels = "aeiou"
  let consonants = "bcdfghjklmnpqrstvwxyz"
  
  var vowelCount = 0
  var consonantCount = 0
  
  for letter in str.lowercased() {
    if vowels.contains(letter) {
      vowelCount += 1
    } else if consonants.contains(letter) {
      consonantCount += 1
    }
  }
  
  return (vowelCount, consonantCount)
}

assert(challenge10(str: "Swift Coding Challenges") == (6, 15), "Challenge 10 failed")
assert(challenge10(str: "Mississippi") == (4, 7), "Challenge 10 failed")

// Challenge 11
// Write a function that accepts two strings, and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.
func challenge11(first: String, second: String) -> Bool {
  guard first.count == second.count else { return false }
  
  let firstArray = Array(first)
  let secondArray = Array(second)
  
  var differences = 0
  for (index, letter) in firstArray.enumerated() {
    if secondArray[index] != letter {
      differences += 1
      if differences == 4 {
        return false
      }
    }
  }
  return true
}

assert(challenge11(first: "Clamp", second: "Cramp") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Crams") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Grams") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Grans") == false, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Clam") == false, "Challenge 11 failed")
assert(challenge11(first: "clamp", second: "maple") == false, "Challenge 11 failed")

// Challenge 12
// Write a function that accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes all words.
func challenge12(input: String) -> String {
  let parts = input.components(separatedBy: " ")
  guard let first = parts.first else { return "" }
  
  var currentPrefix = ""
  var bestPrefix = ""
  
  for letter in first {
    currentPrefix.append(letter)
    for word in parts {
      if !word.hasPrefix(currentPrefix) {
        return bestPrefix
      }
    }
    bestPrefix = currentPrefix
  }
  
  return bestPrefix
}

assert(challenge12(input: "swift switch swill swim") == "swi", "Challenge 12 failed")
assert(challenge12(input: "flip flap flop") == "fl", "Challenge 12 failed")

// Challenge 13
// Write a function that accepts a string as input, then returns how often each letter is repeated in a single run, taking case into account.
func challenge13(input: String) -> String {
  var currentLetter: Character?
  var returnString = ""
  var repeatCounter = 0
  
  for letter in input {
    if letter == currentLetter {
      repeatCounter += 1
    } else {
      if let currentLetter = currentLetter {
        returnString.append("\(currentLetter)\(repeatCounter)")
      }
      
      currentLetter = letter
      repeatCounter = 1
    }
  }
  
  if let currentLetter = currentLetter {
    returnString.append("\(currentLetter)\(repeatCounter)")
  }
  
  return returnString
}

assert(challenge13(input: "aabbcc") == "a2b2c2", "Challenge 13 failed")
assert(challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed")
assert(challenge13(input: "aaAAaa") == "a2A2a2", "Challenge 13 failed")

// Challenge 14
// Write a function that prints all possible permutations of a given input string.
func challenge14(string: String, current: String = "") {
  let length = string.count
  let strArray = Array(string)
  if (length == 0) {
    print(current)
  } else {
    print(current)
    for i in 0 ..< length {
      let left = String(strArray[0 ..< i])
      let right = String(strArray[i+1 ..< length])
      challenge14(string: left + right, current: current + String(strArray[i]))
    }
  }
}
