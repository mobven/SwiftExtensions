//
//  UIStackView+Extensions.swift
//  SwiftExtensions
//
//  Created by Samet Macit on 4.01.2021.
//  Copyright © 2020 Mobven. All rights reserved.

import UIKit

public extension UIStackView {
    /// Adds views to the end of the arrangedSubviews array.
    /// - Parameter subViews: Views to be added to the array of views arranged by the stack.
    func addArrangedSubviews(_ subViews: UIView...) {
        subViews.forEach(addArrangedSubview(_:))
    }

    /// Removes all views from the stack’s array of arranged subviews.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
