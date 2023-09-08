//
//  ContentView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - Accessibility Basic
                /// .accessibilityElement(children: .contain)
                /// .accessibilityElement(children: .combine)
                /// .accessibilitySortPriority(1)
                /// .accessibilityHidden(true)
                /// More info about label, value
                ActivityCardsView()
                // MARK: - Common Issues
                /// .accessibilityChildren
                GrossGraphView()
                    .padding()
                Spacer()
                /// .accessibilityRepresentation
                Button("Delete") {}
                    .buttonStyle(SymbolButtonStyle(systemName: "trash"))
                    .frame(width: 64, height: 64)
                    .accessibilityValue("Needs for remove items")
//                    .accessibilityLabel("Delete")
                    .accessibilityHint("During Tap it will change color")
                Spacer()
                // MARK: - Accessibility Rotors
                /// .accessibilityRotor
                RotorExampleNavigation()
                // TODO: More useful example with rotors
            }
                .navigationTitle("Accessibility Demo")
            //                .accessibilityAddTraits(.isHeader)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
