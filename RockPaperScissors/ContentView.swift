//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ram G on 3/2/23.
//

import SwiftUI



struct ContentView: View {
   
    @State private var shouldWin = Bool.random()
    @State private var appChoice = Int.random(in: 0..<3)
    //@State private var playerChoice = ""
    @State private var playerScore = 0
    @State private var numRounds = 0
    @State private var gameEnd = false
    
    private var choices = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.33, blue: 0.5)
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
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 30))
                
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        Image(choices[number])
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Text("Player Score: \(playerScore)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
        }
    }
    
    func choiceTapped(_ playerChoice: Int) {
        numRounds += 1;
        // need to determine if player won or lost
        
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
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
