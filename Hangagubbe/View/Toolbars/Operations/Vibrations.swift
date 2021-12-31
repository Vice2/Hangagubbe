//
//  Vibrations.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import Foundation
import SwiftUI


struct Vibrations {
    
    static func lightVibration() {
#if os(iOS)
        let impact = UIImpactFeedbackGenerator(style: .light)
        impact.impactOccurred()
#endif
    }
    
    static func heavyVibration() {
#if os(iOS)
        let impact = UIImpactFeedbackGenerator(style: .heavy)
        impact.impactOccurred()
#endif
    }
}
