//
//  UIViewController+Extension.swift
//  SwiftExtensions
//
//  Created by Samet Macit on 22.02.2021.
//  Copyright © 2021 Mobven. All rights reserved.

import UIKit

public extension UIViewController {
    /// Height of the status bar.
    var topBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                (navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }
}
