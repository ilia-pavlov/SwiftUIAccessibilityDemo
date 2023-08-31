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
                Spacer()
                // MARK: - Accessibility Rotors
                /// .accessibilityRotor
                RotorExampleNavigation()
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
