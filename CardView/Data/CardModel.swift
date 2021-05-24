//
//  CardModel.swift
//  CardView
//
//  Created by Christopher Hicks on 5/15/21.
//

import SwiftUI


struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
