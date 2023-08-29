//
//  ContentView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            OtherCards()
            CanvasExample()
                .padding(.bottom, 300.0)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
