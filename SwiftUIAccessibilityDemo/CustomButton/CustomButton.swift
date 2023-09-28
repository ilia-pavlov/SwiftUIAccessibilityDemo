//
//  CustomButton.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 9/14/23.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var buttonLabel: String
    var imageName: String
    
    var body: some View {
        Button(buttonLabel) {}
            .buttonStyle(SymbolButtonStyle(systemName: imageName))
            .frame(width: 64, height: 64)
//            .accessibilityLabel("Delete")
            .accessibilityValue("Needs for remove items")
            .accessibilityHint("Item was replaced")
    }
}
