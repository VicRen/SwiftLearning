//
//  ContentView.swift
//  SwiftLearning
//
//  Created by Vic Ren on 2025/1/10.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🦇","🧛","⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView{cards}
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
                
            }
        }.foregroundColor(.orange)
    }
    
    var cardCountAdjusters : some View {
        HStack {
            cardCountAdjuster(by: -1, symble: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardCountAdjuster(by: 1, symble: "rectangle.stack.badge.plus.fill")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symble: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symble)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
}

struct CardView : View {
    let content: String
    @State var isFaceUp = true
    let base = RoundedRectangle(cornerRadius: 12)
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
