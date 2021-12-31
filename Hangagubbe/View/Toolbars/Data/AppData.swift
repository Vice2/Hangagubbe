//
//  AppData.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import Foundation

class AppData: ObservableObject {
    
    @Published var gameLetters:Array = AppData.getLetters()
    @Published var usedLetters = [String]()
    @Published var correctLetters = [Character]()
    @Published var incorrectLetters = [Character]()
    
    @Published var lives = ["a","a","a","a","a","a","a","a"]
    
    @Published var hapticFeedback : Bool = true
    
    @Published var debugActive : Bool = false
    @Published var debugViewActive : Bool = false
    
    @Published var showingSettings : Bool = false
    @Published var showingStatistics : Bool = false
    //@Published var showingShop : Bool = false
    
    @Published var gameOver : Int = 0
    
    static func getLetters() -> Array<Character> {
        let allWords = WordList.basicList
        let randomWord : String! = allWords.randomElement()
        let letters = Array(randomWord)
        print(letters)
        return letters
    }
}
