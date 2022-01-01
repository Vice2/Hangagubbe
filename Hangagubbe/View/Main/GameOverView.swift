//
//  GameOverView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-02.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    var body: some View {
        if appData.gameOver == 0 {
            GameView(appData: appData, stats: stats)
        } else {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text(appData.gameOver == 2 ? "Korrekt!!" : "Gör ett nytt försök")
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                    Spacer()
                    Text(appData.gameOver == 2 ? "Ordet var" : "Ordet var...")
                        .font(.system(size: 25))
                    HStack {
                        ForEach(appData.gameLetters, id: \.self) { letter in
                            Text(String(letter))
                        }
                        .font(.system(size: 40, weight: .heavy))
                    }
                    .padding(.bottom, 100)
                    Spacer()
                    Button {
                        
                        if appData.gameOver == 1 {
                            stats.increment(key: "GamesPlayed")
                            stats.increment(key: "GamesLost")
                            stats.streak(win: false)
                        } else {
                            stats.increment(key: "GamesPlayed")
                            stats.increment(key: "GamesWon")
                            stats.streak(win: true)
                        }
                        
                        
                        
                        appData.gameOver = 0
                        appData.gameLetters = AppData.getLetters()
                        print("--new game started--")
                        appData.usedLetters.removeAll()
                        if appData.gameLetters.contains(" ") {
                            appData.correctLetters = [" "]
                        } else {
                            appData.correctLetters.removeAll()
                        }
                        appData.incorrectLetters.removeAll()
                        appData.lives = ["a","a","a","a","a","a","a","a"]
                    } label: {
                        ButtonView(buttonLabel: "Nytt ord")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

/*
struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
*/
