//
//  Cards.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

/// Examples of using dynamically-generated stacks and lists
/// in an accessible way.
struct ActivityCardsView: View {
    @State private var activities: [Activity] = [
        Activity(
            id: 0,
            username: "@annejohnson1",
            caption: "Anne Johnson",
            content: "Status Update"
        ),
        Activity(
            id: 1,
            username: "@meichen3",
            caption: "Mei Chen",
            content: "Status Update"
        ),
        Activity(
            id: 2,
            username: "@user1",
            caption: "David Bo",
            content: "Status Update"
        )
    ]

    var body: some View {
        VStack {
            HStack {
                ForEach(activities) { activity in
                    ActivityCardView(activity: activity)
                }
            }
        }
        .padding()
    }

    public struct Activity: Identifiable {
        var id: Int
        var username: String
        var caption: String
        var content: String
    }

    public struct ActivityCardView: View {
        var activity: Activity
        
        var body: some View {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .accessibilitySortPriority(7)
                        VStack(alignment: .leading) {
                            Text(activity.username)
                                .font(.subheadline)
                                .accessibilitySortPriority(5)
                            Text(activity.caption)
                                .font(.caption)
                                .accessibilitySortPriority(6)
                        }
                        
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    }
                    Divider()
                    Text(activity.content)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
//                .accessibilityElement(children: .combine)
                
                HStack {
                    let buttonBackground = Circle().foregroundColor(Color.blue)
                    let padding: CGFloat = 4
                    
                    Button {} label: {
                        Image(systemName: "hand.thumbsup")
                    }
                    .buttonStyle(.plain)
                    .padding(padding)
                    .background { buttonBackground }

                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "bubble.left")
                    }
                    .buttonStyle(.plain)
                    .padding(padding)
                    .background { buttonBackground }
                }
                .symbolVariant(.fill)
                .padding(.top)
            }
            .foregroundColor(Color.white)
            .frame(width: 100)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(white: 0.2))
                    .frame(width: 135, height: 150)
            }
            
            .accessibilityElement(children: .contain)
//            .accessibilityElement(children: .combine)
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardsView()
    }
}

