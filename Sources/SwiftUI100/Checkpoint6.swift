// Create a struct to store information about a car, including:
//   - Its model
//   - Number of seats
//   - Current gear
// Then add a method to change gears up or down.
//
// Have a think about variables and access control:
//   - What data should be a variable rather than a constant, and what data should be exposed publicly?
//   - Should the gear-changing method validate its input somehow?

struct Car {
  let model: String
  let seats: Int
  private(set) var gear = 1

  mutating func Shift(to: Int) -> Bool {
    guard to > 0 && to <= 10 else {
      return false
    }

    self.gear = to
    return true
  }
}

var mazda = Car(model: "Mazda 3", seats: 5)

print(
  """
  The car is a \(mazda.model)
  It has \(mazda.seats) seats
  It is currently on gear \(mazda.gear)
  """)

_ = mazda.Shift(to: 5)
print("It is now on gear \(mazda.gear)")
