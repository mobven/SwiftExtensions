//
//  CALayer.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 15.03.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation
import UIKit

public extension CALayer {
    /// Adds shadow with Zeplin compliance.
    /// - Parameters:
    ///   - color: Shadow color
    ///   - x: Shadow x
    ///   - y: Shadow y
    ///   - blur: Shadow blurness
    ///   - spread: Shadow spread
    func makeShadow(
        color: UIColor,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0,
        spread: CGFloat = 0
    ) {
        shadowColor = color.cgColor
        shadowOpacity = 1
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2
        if spread == 0 {
            shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
