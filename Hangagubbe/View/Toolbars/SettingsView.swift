//
//  SettingsView.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-01.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var stats: Statistics
    @State private var showingSheet = false
    
    @AppStorage("DebugActive") var debugActive = false
    @AppStorage("HapticFeedback") var hapticFeedback = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    
                    /*NavigationLink {
                        WordListView(appData: appData, stats: stats)
                    } label: {
                        ListLabel(imageName: "book", label: "Ordpack")
                    }*/
                    
#if os(iOS)
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        Toggle(isOn: $hapticFeedback) {
                            ListLabel(imageName: "iphone.radiowaves.left.and.right", label: "Haptic Feedback")
                        }
                    }
#endif
                }
#if DEBUG
               /* Section {
                    Toggle(isOn: $debugActive) {
                        ListLabel(imageName: "ladybug", label: "Debug Läge")
                    }
                        if debugActive {
                            NavigationLink {
                                DebugOptions(appData: appData, stats: stats)
                            } label: {
                                ListLabel(imageName: "ant", label: "Debug Alternativ")
                        }
                    }
                }*/
#endif
                Section {
                    Button {
                        showingSheet = true
                    } label: {
                        ListLabel(imageColor: .red,imageName: "trash", label: "Återställ data...")
                            .foregroundColor(.red)
                    }
                    .sheet(isPresented: $showingSheet) {
                        ResetDataView(appData: appData, stats: stats, showingSheet: $showingSheet)
                    }
                }
                
                
            }
#if os(iOS)
            .navigationBarTitle("Inställningar")
#else
            .listStyle(.inset)
#endif
        }
    }
}

/*
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
*/
