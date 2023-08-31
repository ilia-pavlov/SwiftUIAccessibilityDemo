//
//  RotorView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/30/23.
//

import SwiftUI

/// A rotor example using a lazy vertical stack.
///
/// Accessibility  elements are scrolled into place
/// automatically when the user chooses the Rotor entry in VoiceOver.
/// This code has access to the full list of Rotor entries, so pass
/// the list in directly as a convenience.
struct RotorView: View {
    var model = RotorModel()

    var body: some View {
        LazyVStack {
            ForEach(model.values) { value in
                ElementView(color: value.color,
                                         text: Text(value.label))
            }
        }
        .accessibilityRotor("Special Values",
                            entries: model.values.filter(\.isRotorEntry),
                            entryLabel: \.label)
    }
}

/// Navigation content for all the specific examples of rotors.
struct RotorExampleNavigation: View {
    var body: some View {
        NavigationLink(destination: RotorView()) {
            Text("Stack Rotor")
        }
    }
}

struct RotorsExample: View {
    var body: some View {
        VStack(spacing: 10) {
            RotorExampleNavigation()
        }
    }
}

struct RotorsExample_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView { // Make sure you have NavigationView here
                RotorExampleNavigation()
        }
    }
}
