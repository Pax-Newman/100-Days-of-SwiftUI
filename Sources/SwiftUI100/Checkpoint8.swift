// make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it.
//
// Your protocol should require the following:
// - property storing how many rooms it has.
// - property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// - property storing the name of the estate agent responsible for selling the building.
// - method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
  var rooms: Int { get }
  var cost: Int { get }
  var agency: String { get }
  func summary()
}

extension Building {

  func summary() {
    print(
      """
      The building has \(rooms) rooms.
      It is being sold for $\(cost) by \(agency).
      """)
  }
}

struct House: Building {
  let rooms: Int
  let cost: Int
  let agency: String
}

struct Office: Building {
  let rooms: Int
  let cost: Int
  let agency: String
}

House(rooms: 4, cost: 500_000, agency: "Rundegar Estates").summary()
Office(rooms: 100, cost: 4_350_000, agency: "Aphex Holdings").summary()
