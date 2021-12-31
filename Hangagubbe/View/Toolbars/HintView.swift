//
//  HintView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI

struct HintView: View {
    @ObservedObject var stats: Statistics
    var body: some View {
        List{
            Button {
                stats.purchase(amount: 15)
                stats.increment(key: "Hints")
            } label: {
                StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X1", statisticAmount: 15)
            }
            
            Button {
                stats.purchase(amount: 40)
                stats.increment(key: "Hints", amount: 3)
            } label: {
                StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X3", statisticAmount: 40)
            }
            
            Button {
                stats.purchase(amount: 75)
                stats.increment(key: "Hints", amount: 6)
            } label: {
                StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X6", statisticAmount: 75)
            }
        }
    }
}


/*
 struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView()
    }
}
*/
