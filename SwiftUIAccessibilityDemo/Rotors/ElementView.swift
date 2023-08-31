//
//  ElementView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/30/23.
//

import SwiftUI

/// A view for representing an accessibility element visually.
struct ElementView: View {
    let color: Color
    let text: Text

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 10)
        text.padding(8)
            .font(.title)
            .frame(minWidth: 150, alignment: .center)
            .background {
                shape.fill(color)
            }
            .overlay {
                shape.strokeBorder(.white, lineWidth: 2)
            }
            .overlay {
                shape.strokeBorder(.gray, lineWidth: 1)
            }
    }
}

struct ElementView_Preview: PreviewProvider {
    static var previews: some View {
        ElementView(color: .blue, text: Text("One"))
    }
}
