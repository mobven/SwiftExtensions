//
//  Double+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 19.03.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation

public extension Double {
    /// Rounds double with minimum zero fraction digits.
    var rounded: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = .zero
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
