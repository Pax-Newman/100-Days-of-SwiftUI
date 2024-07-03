//
//  ContentView.swift
//  WeSplit
//
//  Created by Pax Newman on 6/29/24.
//

import SwiftUI

struct ContentView: View {

  @FocusState private var amountIsFocused: Bool

  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 10

  let tipPercentages = [0, 10, 15, 20, 25]

  var tipValue: Double {
    let tipSelection = Double(tipPercentage)

    return (checkAmount / 100) * tipSelection
  }

  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)

    let total = checkAmount + tipValue
    let perPerson = total / peopleCount

    return perPerson
  }

  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField(
            "Amount", value: $checkAmount,
            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
          )
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)

          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }

        Section("How much tip would you like to leave?") {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(tipPercentages, id: \.self) {
              Text($0, format: .percent)
            }
          }
          .pickerStyle(.segmented)
        }

        Section("Total check") {
          Text(
            checkAmount + tipValue,
            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
          )
        }

        Section("Amount per person") {
          Text(
            totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD")
          )
        }

      }
      .navigationTitle("WeSplit")
      .toolbar {
        if amountIsFocused {
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
