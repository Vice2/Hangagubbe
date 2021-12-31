//
//  DebugView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI

struct DebugView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    var body: some View {
        VStack{
            HStack {
                Text("Word")
                ForEach(appData.gameLetters, id: \.self) { letter in
                    Text(String(letter))
                }
                Spacer()
            }

            HStack {
                Text("Correct")
                ForEach(appData.correctLetters, id: \.self) { letter in
                    Text(String(letter))
                }
                Spacer()
            }

            HStack {
                Text("Incorrect")
                ForEach(appData.incorrectLetters, id: \.self) { letter in
                    Text(String(letter))
                }
                Spacer()
            }
            HStack {
                Text("Hints Left \(stats.defaults.integer(forKey: "Hints"))")
                Spacer()
            }
        }.padding()
    }
}

/*
struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
*/
