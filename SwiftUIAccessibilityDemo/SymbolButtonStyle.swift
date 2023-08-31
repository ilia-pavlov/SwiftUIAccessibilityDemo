//
//  SymbolButtonStyleView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/30/23.
//

import SwiftUI

/// A button style that shows only a symbol.
///
/// This style uses the label only for accessibility; the label is not rendered visually.
struct SymbolButtonStyle: ButtonStyle {
    let systemName: String

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(configuration.isPressed ? Color.red : Color.blue)

            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .padding(8)
        }
        
        // Use `accessibilityRepresentation` to replace accessibility with that of
        // the configuration's label. Otherwise, the accessibility
        // of this `Button` would come only from the `Image`, and the `label` passed
        // into the `Button` when it is constructed would be lost, because it isn't
        // rendered visually for this style.
        .accessibilityRepresentation { configuration.label }
    }
}

struct SymbolButtonStyleView_Preview: PreviewProvider {
    static var previews: some View {
        Button("Delete") {}
            .buttonStyle(SymbolButtonStyle(systemName: "trash"))
            .frame(width: 64, height: 64)
    }
}
