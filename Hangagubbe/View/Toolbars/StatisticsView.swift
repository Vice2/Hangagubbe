//
//  StatisticsView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-01.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var stats: Statistics
    
    var body: some View {
#if os(iOS)
        TabView {
            NavigationView {
                StatisticsList(stats: stats)
                    .navigationViewStyle(.stack)
            }
            .tabItem {
                VStack{
                    Image(systemName: "textformat.123")
                    Text("Statistik")
                }
            }
            NavigationView {
                AchievementsView(stats: stats)
                    .navigationViewStyle(.stack)
            }
            /*.tabItem {
                VStack{
                    Image(systemName: "crown")
                    Text("Prestation")
                }
            }*/
        }
#else
        ZStack {
            StatisticsList(stats: stats)
        }
        .frame(width: 300, height: 400)
        
#endif
    }
}

struct StatisticsLabel: View {
    var imageColor: Color = .accentColor
    var imageName: String
    var label: String
    var statisticAmount: Int
    
    
    var body: some View {
        HStack{
            ListLabel(imageColor: imageColor, imageName: imageName, label: label)
            
            Spacer()
            
            Text(String(statisticAmount))
                .opacity(0.7)
                .font(.system(size: 17))
        }
        .frame(height: 30)
    }
}

struct StatisticsList: View {
    @ObservedObject var stats: Statistics
    
    var body: some View {
        List {
            Section{
                StatisticsLabel(imageName: "123.rectangle", label: "Spelade", statisticAmount: stats.defaults.integer(forKey: "GamesPlayed"))
                StatisticsLabel(imageName: "checkmark.seal", label: "Vunnit", statisticAmount: stats.defaults.integer(forKey: "GamesWon"))
                StatisticsLabel(imageName: "xmark.diamond", label: "Förlorat", statisticAmount: stats.defaults.integer(forKey: "GamesLost"))
            }
           /* Section {
                StatisticsLabel(imageName: "bag.circle", label: "Money Spent", statisticAmount: stats.defaults.integer(forKey: "MoneySpent"))
                StatisticsLabel(imageName: "dollarsign.circle", label: "Money Obtained", statisticAmount: stats.defaults.integer(forKey: "MoneyObtained"))
            }*/
            Section {
                StatisticsLabel(imageName: "flame", label: "Nuvarande vinstsvit", statisticAmount: stats.defaults.integer(forKey: "CurrentWinStreak"))
                StatisticsLabel(imageName: "crown", label: "Längsta vinstsvit", statisticAmount: stats.defaults.integer(forKey: "LongestWinStreak"))
            }
            Section {
                StatisticsLabel(imageName: "exclamationmark.circle", label: "Nuvarande förlustsvit", statisticAmount: stats.defaults.integer(forKey: "CurrentLossStreak"))
                StatisticsLabel(imageName: "xmark.octagon", label: "Längsta förlustsvit", statisticAmount: stats.defaults.integer(forKey: "LongestLossStreak"))
            }
            Section {
                StatisticsLabel(imageName: "timer", label: "Genomnsnittlig tid*", statisticAmount: 0)
                StatisticsLabel(imageName: "clock", label: "Total spelad tid*", statisticAmount: 0)
            }
            Section {
                StatisticsLabel(imageName: "keyboard", label: "Tryckta knappar", statisticAmount: stats.defaults.integer(forKey: "ButtonsPressed"))
            }
        }
        .navigationTitle("Statistik")
    }
}

