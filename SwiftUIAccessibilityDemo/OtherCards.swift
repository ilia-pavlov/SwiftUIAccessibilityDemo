//
//  OtherCards.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

struct OtherCards: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    UserCards(name: "John Doe", status: "status update")
                    UserCards(name: "David Bo", status: "report")
                }
                Spacer()
            }
        }
    }
    
    struct UserCards: View {
        let name: String
        let status: String
        var body: some View {
            GroupBox(label: Text(name)) {
                Text(status)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                HStack {
                    Button {} label: {
                        Image(systemName: "hand.thumbsup")
                    }
                    .font(.title)
                    Spacer()
                    Button {} label: {
                        Image(systemName: "bubble.left")
                    }
                    .font(.title)
                }
            }
            //            .padding()
        }
    }
}


struct OtherCards_Previews: PreviewProvider {
    static var previews: some View {
        OtherCards()
    }
}
