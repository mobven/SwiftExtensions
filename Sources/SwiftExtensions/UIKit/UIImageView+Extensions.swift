//
//  UIImageView+Extensions.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 28.04.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {
    /// Applies specified color to the image.
    /// - Parameter color: Color to be applied.
    func setImageColor(color: UIColor) {
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        image = templateImage
        tintColor = color
    }
}
