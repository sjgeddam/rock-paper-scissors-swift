//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ram G on 3/2/23.
//

import SwiftUI



struct ContentView: View {
   
    @State private var shouldWin = Bool.random()
    @State private var appChoice = "Rock"
    private var choices = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Player Score: ")
                    Text("App Move: ")
                    Text("Win or Lose: ")
                    Text("Player Move:")
                }
                
                ForEach(0..<3) { number in
                    Button(choices[number]) {
                        choiceTapped(number)
                    }
                }
            }
        }
    }
    
    func choiceTapped(_ choice: Int) {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
