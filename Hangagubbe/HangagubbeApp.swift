//
//  HangagubbeApp.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import SwiftUI
import Foundation
#if os(macOS)
import AppKit


@main
struct HangmanApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowToolbarStyle(.unified)
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

#else

@main
struct HangmanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#endif
