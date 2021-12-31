//
//  Stastistics.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import Foundation

class Statistics: ObservableObject {
    @Published var defaults = UserDefaults.standard
    
    ///    Increments UserDefaults item by amount
    func increment(key: String, amount: Int? = 1) {
        var num = defaults.integer(forKey: key)
        num += amount!
        defaults.set(num, forKey: key)
    }
    ///  Subtracts UserDefaults item by amount
    func subtract(key: String, amount: Int? = 1) {
        var num = defaults.integer(forKey: key)
        num -= amount!
        defaults.set(num, forKey: key)
    }
    
    ///    Subtracts and amount of money then adds same amount to money spent
    func purchase(amount: Int) {
        if amount <= defaults.integer(forKey: "CurrentMoney") {
            
            var spent = defaults.integer(forKey: "MoneySpent")
            var current = defaults.integer(forKey: "CurrentMoney")
            current -= amount
            spent += amount
            defaults.set(current, forKey: "CurrentMoney")
            defaults.set(spent, forKey: "MoneySpent")
            
        }
    }
    ///  Calculates the win and loss streaks
    func streak(win: Bool) {
        if defaults.integer(forKey: win ? "CurrentWinStreak" : "CurrentLossStreak") == defaults.integer(forKey: win ? "LongestWinStreak" : "LongestLossStreak") {
            increment(key: win ? "LongestWinStreak" : "LongestLossStreak")
        }
        increment(key: win ? "CurrentWinStreak" : "CurrentLossStreak")
        defaults.set(0, forKey: win ? "CurrentLossStreak" : "CurrentWinStreak")
    }
}
