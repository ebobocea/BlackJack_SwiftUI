//
//  ChipView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import SwiftUI

struct ChipView: View {
    @State private var image: Image?
    @State private var valueOfChip: Text?
    
    init(image: Image?, valueOfChip: Text?) {
        self._image = State(initialValue: image)
        self._valueOfChip = State(initialValue: valueOfChip)
    }
    var body: some View {
        ZStack{
            if image != nil {
                image!
                    .resizable()
                    .frame(width: 70, height: 70)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
            } else {
                Text("No image")
            }
            if valueOfChip != nil {
                    valueOfChip!
            } else {
                Text("Err..")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(image: Image("WhiteChip"), valueOfChip: Text("200"))
//            .previewLayout(.sizeThatFits)
    }
}
