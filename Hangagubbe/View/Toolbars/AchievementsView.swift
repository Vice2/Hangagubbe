//
//  AchievementsView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-01.
//

import SwiftUI

struct AchievementsView: View {
    @ObservedObject var stats: Statistics
    
    let screen = UIScreen.main.bounds
    var body: some View {
        HStack {
            List {
                Section(header: Text("Prestation avslutad")) {
                    ForEach(0..<4, id: \.self) {_ in
                        StatisticsLabel(imageName: "star.fill", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
                Section(header: Text("Prestationsförsök")) {
                    ForEach(0..<3, id: \.self) {_ in
                        StatisticsLabel(imageName: "star.leadinghalf.filled", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
                Section(header: Text("Oavslutade Prestationer")) {
                    ForEach(0..<6, id: \.self) {_ in
                        StatisticsLabel(imageName: "star", label: "Sample Award", statisticAmount: 0)
                            .padding(.trailing)
                    }
                }
            }
            .navigationTitle("Prestationer")
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        let stats = Statistics()
        AchievementsView(stats: stats)
    }
}
