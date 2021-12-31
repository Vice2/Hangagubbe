//
//  WordListModel.swift
//  Hangagubbe
//
//  Created by Bashar Al Bagdadi on 2021-12-31.
//

import Foundation

struct WordListModel: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var list: Array<String>
}
