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
        
        .accessibilityRepresentation { configuration.label }
//        .accessibilityLabel(configuration.label)
    }
}

struct SymbolButtonStyleView_Preview: PreviewProvider {
    static var previews: some View {
        Button("Delete") {}
            .buttonStyle(SymbolButtonStyle(systemName: "trash"))
            .frame(width: 64, height: 64)
    }
}
