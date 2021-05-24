//
//  ContentView.swift
//  CardView
//
//  Created by Christopher Hicks on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    var cards: [Card] = cardData
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .padding(25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
