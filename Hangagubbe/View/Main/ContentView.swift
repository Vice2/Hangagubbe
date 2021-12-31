//
//  ContentView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appData = AppData()
    @StateObject var stats = Statistics()
    
    var body: some View {
        PlatformView(appData: appData, stats: stats)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData()).environmentObject(Statistics())
    }
}

