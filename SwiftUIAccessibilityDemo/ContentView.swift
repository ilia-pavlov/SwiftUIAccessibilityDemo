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
                ActivityCardsView()
                GrossGraphView()
                    .padding()
                Spacer()
                CustomButton(buttonLabel: "Delete", imageName: "trash")
                Spacer()
                RotorExampleNavigation()
            }
                .navigationTitle("Accessibility Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
