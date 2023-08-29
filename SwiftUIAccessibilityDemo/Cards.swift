//
//  Cards.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

/// Examples of using dynamically-generated stacks and lists
/// in an accessible way.
struct Cards: View {
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
                    ActivityCell(activity: activity)
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

    public struct ActivityCell: View {
        var activity: Activity
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                    VStack(alignment: .leading) {
                        Text(activity.username)
                            .font(.subheadline)
                            .accessibilityHidden(true)
                        Text(activity.caption)
                            .font(.caption)
                            .accessibilitySortPriority(1)
                    }
                    
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                }

                Divider()

                Text(activity.content)

                HStack {
                    let buttonBackground = Circle().foregroundColor(Color.blue)
                    let padding: CGFloat = 4

                    Button {} label: {
                        Image(systemName: "hand.thumbsup")
                    }
                    .buttonStyle(.plain)
                    .padding(padding)
                    .background { buttonBackground }

                    Button {} label: {
                        Image(systemName: "bubble.left")
                    }
                    .buttonStyle(.plain)
                    .padding(padding)
                    .background { buttonBackground }
                }
                .symbolVariant(.fill)
            }
            .foregroundColor(Color.white)
            .frame(width: 60)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(white: 0.2))
            }
            // The combine value merges accessibility properties, turning
            // Buttons into custom actions. Note that some labels
            // and traits are ignored. For example, the label
            // from the `Image` and its traits are ignored since
            // other elements provide a label.
//            .accessibilityElement(children: .combine)
            .accessibilityElement(children: .contain)
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        Cards()
    }
}

