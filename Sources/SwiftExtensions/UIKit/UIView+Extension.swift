//
//  UIView+Extension.swift
//  SwiftExtensions
//
//  Created by Rasid Ramazanov on 16.08.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    /// Corner radius of view
    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    /// Border width of view
    @IBInspectable var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// Border color of view
    @IBInspectable var borderColor: UIColor {
        get {
            UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }

    /// Load the view from a nib file called with the name of the class.
    /// - parameter bundle: Bundle for accessing nib file.
    /// - Note: The first object of the nib file **must have identical** name with its class.
    static func loadFromNib(bundle: Bundle) -> Self {
        let nib = bundle.loadNibNamed(String(describing: self), owner: nil, options: nil)
        guard let view = nib?.first as? Self else {
            fatalError("Could not initialize view")
        }
        return view
    }

    /// Adds rounded corners to the view.
    /// - Parameters:
    ///   - corners: The corners of a rectangle.
    ///   - radius: Radius to be applied.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        var masked = CACornerMask()

        if corners.contains(.topLeft) {
            masked.insert(.layerMinXMinYCorner)
        }

        if corners.contains(.topRight) {
            masked.insert(.layerMaxXMinYCorner)
        }

        if corners.contains(.bottomLeft) {
            masked.insert(.layerMinXMaxYCorner)
        }

        if corners.contains(.bottomRight) {
            masked.insert(.layerMaxXMaxYCorner)
        }

        layer.maskedCorners = masked
    }

    /// View identifier with its class name.
    class var identifier: String {
        String(describing: self)
    }

    /// Adds views to the end of the receiver’s list of subviews.
    /// - Parameter views: Views to be added.
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }

    /// Apply gradient to the view.
    /// - Parameters:
    ///   - locations: An optional array of NSNumber objects defining the location of each gradient stop.
    ///   - colors: An array of CGColorRef objects defining the color of each gradient stop.
    ///   - start: The start point of the gradient when drawn in the layer’s coordinate space.
    ///   - end: The end point of the gradient when drawn in the layer’s coordinate space.
    func applyGradient(
        locations: [NSNumber],
        colors: [CGColor],
        start: CGPoint = CGPoint(x: 0, y: 0),
        end: CGPoint = CGPoint(x: 1, y: 1)
    ) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.locations = locations
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: - contraints -

public extension UIView {
    /// Add subview to view and set constraints to fit all bounds.
    /// - Parameter view: To be added as subview.
    func addSubview(pinningView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.pinView(self)
    }

    /// Sets constraints the specified view to fit all bounds.
    /// - Parameter view: To set constraints on.
    func pinView(_ view: UIView, top: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0, bottom: CGFloat = 0) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
            topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
        ])
    }
}
