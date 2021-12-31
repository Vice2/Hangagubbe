//
//  AchievementsView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI

struct AchievementsView: View {
    @ObservedObject var stats: Statistics
    
    let screen = UIScreen.main.bounds
    var body: some View {
        HStack {
            List {
                Section(header: Text("Comleted Acheivements")) {
                    ForEach(0..<4, id: \.self) {_ in
                        StatisticsLabel(imageName: "star.fill", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
                Section(header: Text("Attempted Acheivements")) {
                    ForEach(0..<3, id: \.self) {_ in
                        StatisticsLabel(imageName: "star.leadinghalf.filled", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
                Section(header: Text("Unfinished Acheivements")) {
                    ForEach(0..<6, id: \.self) {_ in
                        StatisticsLabel(imageName: "star", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
            }
            .navigationTitle("Achievements")
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        let stats = Statistics()
        AchievementsView(stats: stats)
    }
}
