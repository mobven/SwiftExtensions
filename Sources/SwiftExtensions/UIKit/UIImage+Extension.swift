//
//  UIImage+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 15.01.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    /// Creates an image object using the named image asset that is compatible with the specified trait collection.
    /// - Parameters:
    ///   - named: The name of the image asset or file.
    ///   - bundle: The bundle containing the image file or asset catalog.
    convenience init?(named: String, in bundle: Bundle) {
        self.init(named: named, in: bundle, compatibleWith: nil)
    }

    /// Returns image scaled to the specified witdh preserving ascpect ratio.
    /// - Parameter width: New width.
    func scalePreservingAspectRatio(width: CGFloat) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = width / size.width
        let heightRatio = width / size.height

        let scaleFactor = min(widthRatio, heightRatio)

        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }

        return scaledImage
    }
}
