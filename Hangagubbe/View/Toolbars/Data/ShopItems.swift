//
//  ShopItems.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import Foundation


struct ShopItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var price: Int
    var puchased: Bool = false
}
