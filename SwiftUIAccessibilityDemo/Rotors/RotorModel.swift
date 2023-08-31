//
//  RotorModel.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/30/23.
//

import SwiftUI

/// Example data model for Rotor examples.
struct RotorModel {
    struct Value: Identifiable {
        var label: String
        var color: Color
        var isRotorEntry: Bool = false

        var id: String {
            label
        }
    }

    var values: [Value] = [
        Value(label: "one", color: .green),
        Value(label: "two", color: .blue),
        Value(label: "Work Email", color: .green, isRotorEntry: true),
        Value(label: "four", color: .purple),
        Value(label: "Debit Card Fraud", color: .red, isRotorEntry: true),
        Value(label: "six", color: .yellow),
        Value(label: "seven", color: .brown)
    ]
}
