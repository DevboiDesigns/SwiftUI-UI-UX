//
//  CardView.swift
//  CardView
//
//  Created by Christopher Hicks on 5/15/21.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    var card: Card
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    
    @State private var showingAlert = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showingAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                
            })
            .offset(y: moveUpward ? 210 : 300)
            
            
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[5])
            .previewLayout(.sizeThatFits)
    }
}
