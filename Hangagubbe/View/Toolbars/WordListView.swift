//
//  WordListView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-01.
//

import SwiftUI

struct WordListView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    var body: some View {
        VStack{
            List {
                ForEach(allLists) { list in
                    ListLabel(imageName: list.icon, label: list.name)
                }
                Section{
                    Button {
                        appData.showingSettings.toggle()
                        //openShop()
                    } label: {
                        ListLabel(imageName: "dollarsign.circle", label: "Öppna shop")
                    }
                }
            }
            
        }
    }
    /*
    func openShop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            appData.showingShop.toggle()
        }
    }
     */
}

/*
struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
    }
}
*/
