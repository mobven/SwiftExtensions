//
//  UIControl+Extension.swift
//  SwiftExtensions
//
//  Created by Samet Macit on 10.03.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//
import UIKit

public extension UIControl {
    /// Simulates specified event for `UIControl`
    /// - Parameter event: Event type.
    func simulateEvent(_ event: UIControl.Event) {
        for target in allTargets {
            let localTarget = target as NSObjectProtocol
            for actionName in actions(forTarget: localTarget, forControlEvent: event) ?? [] {
                let selector = Selector(actionName)
                localTarget.perform(selector)
            }
        }
    }
}
