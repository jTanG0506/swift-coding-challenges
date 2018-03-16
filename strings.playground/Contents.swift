// Chapter 1 - Strings

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

