//
//  CardView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

struct CardView: View {
    @State private var image: Image?
    
    init(image: Image?) {
        self._image = State(initialValue: image)
    }
    var body: some View {
        
        if image != nil {
            image!
                .resizable()
                .frame(width: 100, height: 150)
                .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
        } else {
            Text("No image")
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: Image("ace_clubs"))
            .previewLayout(.sizeThatFits)
    }
}

struct CardBackView: View {
    var body: some View {
        Image("cardback")
            .resizable()
            .frame(width: 100, height: 150)
            .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
            .previewLayout(.sizeThatFits)
    }
}

