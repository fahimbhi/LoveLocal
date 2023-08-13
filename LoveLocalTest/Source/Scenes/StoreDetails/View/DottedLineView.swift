//
//  DottedLineView.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit

class DottedLineView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Set line properties
        let color = UIColor(red: 229/252, green: 229/252, blue: 229/252, alpha: 1).cgColor
        let lineWidth: CGFloat = 1.5
        let pattern: [CGFloat] = [1, 4]
        
        // Get the current context
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Set line properties
        context.setStrokeColor(color)
        context.setLineWidth(lineWidth)
        context.setLineDash(phase: 0, lengths: pattern)
        
        // Draw the line
        context.move(to: CGPoint(x: rect.minX, y: rect.midY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        context.strokePath()
    }
}

