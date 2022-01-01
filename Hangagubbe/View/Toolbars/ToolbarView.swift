//
//  ToolbarView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-01.
//

import SwiftUI

struct ToolbarMainView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    var body: some View {
        
        Button{
            appData.showingStatistics.toggle()
        } label: {
            Image(systemName: "list.bullet.rectangle")
        }
#if os(iOS)
        .sheet(isPresented: $appData.showingStatistics) {
            StatisticsView(stats: stats)
        }
#else
        .popover(isPresented: $appData.showingStatistics) {
            StatisticsView(stats: stats)
        }
#endif
        
        Button {
            appData.showingSettings.toggle()
        } label: {
            Image(systemName: "gearshape")
        }
#if os(iOS)
        .sheet(isPresented: $appData.showingSettings) {
            SettingsView(appData: appData, stats: stats)
        }
#else
        .popover(isPresented: $appData.showingSettings) {
            SettingsView(appData: appData, stats: stats)
        }
#endif
    }
}

struct ToolbarSubView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    
    var body: some View {
       /*Button{
           appData.showingShop.toggle()
        } label: {
            Image(systemName: "dollarsign.circle")
            Text(String(stats.defaults.integer(forKey: "CurrentMoney")))
                .offset(x: -5)
        }*/
#if os(iOS)
      /*  .sheet(isPresented: $appData.showingShop) {
            ShopView(stats: stats, appData: appData)
        }
         */
#else
        .popover(isPresented: $appData.showingShop) {
            ShopView(stats: stats, appData: appData)
        }
#endif
    }
}

/*
struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
*/
