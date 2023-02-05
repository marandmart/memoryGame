//
//  Pie.swift
//  MemoryGame
//
//  Created by Mário André Martins on 05/02/23.
//

import SwiftUI

struct Pie: Shape {
    var start: Double
    var end: Double
    var startAngle: Angle {
        get { Angle(degrees: start - 90) }
    }
    var endAngle: Angle {
        get { Angle(degrees: end - 90) }
    }
    var clockwise: Bool = true
    var scalingFactor: Double
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2 * scalingFactor
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        p.addLine(to: center)
        
        return p
    }
    
}
