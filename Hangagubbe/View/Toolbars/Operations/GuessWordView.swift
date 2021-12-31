//
//  GuessWordView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI

struct GuessWordView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    @State var guess: String = ""
    @Binding var showingGuesser: Bool
    
    var body: some View {
        HStack {
            TextField("Whats your guess?", text: $guess)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    checkGuess()
                }
                .submitLabel(.done)
                .disableAutocorrection(true)
            
            if guess != "" {
                Button {
                    checkGuess()
                } label: {
                    Text("Submit")
                }
                .frame(width: 55)
            } else {
                Button {
                    showingGuesser = false
                } label: {
                    Text("Cancel")
                }
                .frame(width: 55)
            }
        }
    }
    
    ///Checks to see if the guess is the same as the current word
    func checkGuess() {
        let guessLettersSet: Set<Character> = Set<Character>(guess.uppercased())
        let gameLettersSet: Set<Character> = Set<Character>(appData.gameLetters)
        
        if guessLettersSet == gameLettersSet {
            appData.gameOver = 2
            guessLettersSet.forEach { letter in
                if appData.correctLetters.contains(letter) {} else {
                    stats.increment(key: "MoneyObtained", amount: 3)
                    stats.increment(key: "CurrentMoney", amount: 3)
                }
            }
        } else {
            appData.gameOver = 1
        }
    }
}

/*
struct GuessWordView_Previews: PreviewProvider {
    static var previews: some View {
        GuessWordView()
    }
}
*/
