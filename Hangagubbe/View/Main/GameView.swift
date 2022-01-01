//
//  GameView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-02.
//

import SwiftUI

struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    @State private var showingAlert = false
    @State private var showingGuesser = false
    
    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .white : .black)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                        withAnimation {
                            showingGuesser = false
                    }
                }
            VStack {
                Spacer()
                HStack {
                    ForEach(appData.gameLetters, id: \.self) { letter in
                        if letter == " " {
                            Text(" ")
                                .frame(width: 15)
                                .scaledToFit()
                        } else {
                            if appData.correctLetters.contains(letter) {
                                Text(String(letter))
                                    .font(.system(size: 35, weight: .medium))
                                    .scaledToFit()
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 25, height: 4)
                                    .offset(y: 9)
                            }
                        }
                    }
                    .frame(width: 35, height: 40)
                }
                
                HStack{
                    ForEach(appData.lives, id: \.self) {_ in
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .padding(.top)
                    }
                }
                .frame(height: 60)
                
                if stats.defaults.bool(forKey: "DebugActive") == true {
                    DebugView(appData: appData, stats: stats)
                        .padding(.leading)
                }
                
                Spacer()
                
                KeyboardView(appData: appData, stats: stats, showingGuesser: $showingGuesser)
                
                Spacer()
                
                Button {
                    print("Nytt spel knappen tryckt")
                    showingAlert = true
                } label: {
                    ButtonView(buttonLabel: "Ge upp")
                }
                .alert("Är du säker", isPresented: $showingAlert) {
                    Button("Nej", role: .cancel) { print("nytt spel avlutat") }
                    Button("Ja") {
                        appData.gameOver = 1
                    }
                }
            }
        }
    }
}

/*
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
*/
