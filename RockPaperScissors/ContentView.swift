//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ram G on 3/2/23.
//

import SwiftUI


struct PrettyFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.system(size: 30))
            .shadow(color: .black, radius: 1)
    }
}

struct ContentView: View {
   
    @State private var shouldWin = Bool.random()
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var playerScore = 0
    @State private var numRounds = 0
    @State private var gameEnd = false
    
    private var choices = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            Color("myColor")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                VStack {
                    Text("App Choice: \(choices[appChoice])")
                    if shouldWin {
                        Text("You need to win")
                    } else {
                        Text("You need to lose")
                    }
                    Text("Player Move: ")
                }
                .modifier(PrettyFont())
                
                
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        Image(choices[number])
                            .resizable()
                            .frame(width: 120.0, height: 120.0)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Text("Player Score: \(playerScore)/\(numRounds)")
                    .modifier(PrettyFont())
            }
            .alert("GAME OVER! Final score is \(playerScore)/\(numRounds)", isPresented: $gameEnd) {
                Button("Restart Game", action: gameOver)
            }
        }
    }
    
    func choiceTapped(_ playerChoice: Int) {
        // counting number of rounds
        numRounds += 1;
    
        // if player needs to win
        if shouldWin {
            if (choices[appChoice] == "Rock") {
                if choices[playerChoice] == "Paper" { playerScore += 1 }
            }
            if (choices[appChoice] == "Scissors") {
                if choices[playerChoice] == "Rock" { playerScore += 1 }
            }
            if (choices[appChoice] == "Paper") {
                if choices[playerChoice] == "Scissors" { playerScore += 1 }
            }
            
        // if player needs to lose
        } else {
            if (choices[appChoice] == "Rock") {
                if choices[playerChoice] == "Scissors" { playerScore += 1 }
            }
            if (choices[appChoice] == "Scissors") {
                if choices[playerChoice] == "Paper" { playerScore += 1 }
            }
            if (choices[appChoice] == "Paper") {
                if choices[playerChoice] == "Rock" { playerScore += 1 }
            }
        }
        
        if (numRounds == 10) {
            gameEnd = true;
        }
        
        shouldWin.toggle()
        appChoice = Int.random(in: 0..<3)
    }
    
    func gameOver() {
        // reset player score & num rounds after 10 rounds of playing
        numRounds = 0
        playerScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
