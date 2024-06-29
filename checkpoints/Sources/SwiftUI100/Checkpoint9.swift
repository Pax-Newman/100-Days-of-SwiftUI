// Write a function that accepts an optional array of integers, and returns one randomly.
// If the array is missing or empty, return a random number in the range 1 through 100.
//
// Write your function in a single line of code.

func randElement(from: [Int]?) -> Int {
  return from?.randomElement() ?? Array(1...100).randomElement() ?? 0
}

print(randElement(from: Array(1...10)))
print(randElement(from: []))
print(randElement(from: nil))
