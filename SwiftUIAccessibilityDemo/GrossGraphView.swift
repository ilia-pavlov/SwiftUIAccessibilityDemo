//
//  GrossGraphView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by Ilia Pavlov on 8/28/23.
//

import SwiftUI

/// Examples of using a canvas view in an accessible way.
struct GrossGraphView: View {
    var body: some View {
        LinesOfCodeGraph(lines: [30, 12, 2, 34, 50])
    }
}

/// A graph that displays lines of code produced per week.
private struct LinesOfCodeGraph: View {
    var lines: [Int]

    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("Percentages of gross")
                .foregroundColor(Color.white)
                .font(.title)
                .accessibilityAddTraits(.isHeader)

            // `Canvas` isn't accessible by default, and isn't visible to
            // VoiceOver.
            Canvas { context, size in
                let inset: CGFloat = 25
                let insetSize = CGSize(width: size.width, height: size.height - inset * 2)
                let width = insetSize.width / CGFloat(lines.count)
                let max = lines.max() ?? 0
                
                for index in lines.indices {
                    let xInset = width * CGFloat(index)
                    let height = (CGFloat(lines[index]) / CGFloat(max)) * insetSize.height
                    let yInset = insetSize.height - height
                    let path = Path(
                        roundedRect: CGRect(
                            x: xInset + 2.5,
                            y: yInset + inset,
                            width: width - 5,
                            height: height),
                        cornerRadius: 4)
                    context.fill(path, with: .color(Color.blue))
            
                    // MARK: - Exact UI
                    context.draw(
                        Text("\(lines[index]) %")
                            .foregroundColor(Color.white)
                            .font(.caption2),
                        at: CGPoint(
                            x: xInset + width / 2,
                            y: yInset + inset / 2))

                    context.draw(
                        Text("Week \(index + 1)")
                            .foregroundColor(Color.white)
                            .font(.caption2),
                        at: CGPoint(
                            x: xInset + width / 2,
                            y: yInset + height + 1.5 * inset))
                }
            }
            // Set a label for the canvas. This makes the entire view
            // an accessibility element visible to VoiceOver.
            .accessibilityLabel("Lines of Code Bar Graph")

            .accessibilityChildren {
                HStack {
                    ForEach(lines.indices, id: \.self) { index in
                        Rectangle()
                            .accessibilityLabel("Week \(index + 1)")
                            .accessibilityValue("\(lines[index]) %")
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(white: 0.2))
        }
        .frame(height: 300)
    }
}

struct CanvasExample_Previews: PreviewProvider {
    static var previews: some View {
        GrossGraphView()
    }
}

