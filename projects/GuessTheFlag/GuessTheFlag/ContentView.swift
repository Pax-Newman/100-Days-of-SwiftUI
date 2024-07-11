//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pax Newman on 7/3/24.
//

import SwiftUI

enum StateError: Error {
  case valueError(String)
}

struct ContentView: View {

  @State private var countries = [
    "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK",
    "Ukraine", "US",
  ].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)

  @State private var showingScore = false
  @State private var scoreTitle = ""

  @State private var score = 0

  @State private var round = 1
  let maxRounds = 8

  @State private var showingEnd = false
  @State private var endText = ""

  func flagTapped(_ number: Int) {

    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 1
    } else {
      scoreTitle = "Incorrect, that was the flag of \(countries[number])"
    }

    if round < maxRounds {
      showingScore = true
    } else {
      endGame()
    }
    round += 1
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }

  func endGame() {
    endText = "You got \(score)/\(round) correct!"
    showingEnd = true
  }

  func reset() {
    score = 0
    round = 1
  }

  var body: some View {
    ZStack {

      RadialGradient(
        stops: [
          .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
          .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
        ], center: .top, startRadius: 200, endRadius: 400
      )
      .ignoresSafeArea()

      VStack {
        Spacer()
        Text("Guess the Flag")
          .font(.largeTitle.bold())
          .foregroundStyle(.white)

        VStack(spacing: 15) {
          VStack {
            Text("Tap the flag of")
              .foregroundStyle(.secondary)
              .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
          }

          ForEach(0..<3) { number in
            Button {
              flagTapped(number)
            } label: {
              Image(countries[number])
            }
            .clipShape(.capsule)
            .shadow(radius: 5)
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 20))

        .alert(scoreTitle, isPresented: $showingScore) {
          Button("Continue", action: askQuestion)
        } message: {
          Text("Your score is \(score)")
        }

        .alert("Good Job!", isPresented: $showingEnd) {
          Button(
            "Restart",
            action: {
              reset()
              askQuestion()
            })
        } message: {
          Text(endText)
        }

        Spacer()
        Spacer()
        Text("Score: \(score) / \(round - 1)")
          .foregroundStyle(.white)
          .font(.title.bold())
        Spacer()
      }
      .padding()
    }
  }
}

#Preview {
  ContentView()
}
