//
//  UIApplication+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 13.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit

/// UIApplication extensions.
public extension UIApplication {
    /// Returns height of the status bar on the device.
    class var statusBarHeight: CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = shared.windows.filter { $0.isKeyWindow }.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    /// Returns top view controller in the window.
    func topViewController(
        controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
    ) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController as? UINavigationController {
                return topViewController(controller: selected.visibleViewController)
            }

            return topViewController(controller: tabController.selectedViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }

    /// Opens device settings for the application.
    /// - Parameter completionHandler: The block to execute with the results.
    /// Provide a value for this parameter if you want to be informed of the success or failure of opening the URL.
    /// This block is executed asynchronously on your app's main thread.
    /// The block has no return value and takes the following parameter:
    /// **success**: A Boolean indicating whether the URL was opened successfully.
    func routeToSettings(completionHandler: ((Bool) -> Void)? = nil) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
              canOpenURL(settingsUrl) else {
            return
        }
        open(settingsUrl, options: [:], completionHandler: completionHandler)
    }

    /// Returns UIViewController with the specified generic type.
    ///  If `inScene` is not specified,  this function will look into UIViewController by
    ///  removing ViewController suffix.
    ///  eg. LoginViewController would be queried in Login.storyboard file.
    ///  Otherwise, view controller will be looked up in the specified scene.
    /// - Parameters:
    ///   - named: Scene name of the view controller.
    ///   - isInitialViewController: Bool indicating whether view controler with the
    ///   specified type is initial view controller.
    /// - Returns: Returns specifed controller in the specified storyboard.
    /// Throws error if there controller could not be found.
    class func getViewController<T: UIViewController>(
        inScene named: String? = nil,
        isInitialViewController: Bool = true
    ) -> T {
        let controllerName = String(describing: T.self)
        let storyboardName = named ?? substringStoryboardName(withViewControllerName: controllerName)
        if isInitialViewController,
           let viewController = UIStoryboard(
               name: String(storyboardName), bundle: nil
           ).instantiateInitialViewController() as? T {
            return viewController
        } else if let viewController = UIStoryboard(
            name: String(storyboardName), bundle: nil
        ).instantiateViewController(withIdentifier: controllerName) as? T {
            return viewController
        } else {
            fatalError("InstantiateInitialViewController not found")
        }
    }

    private class func substringStoryboardName(withViewControllerName controllerName: String) -> String {
        let viewControllerName = controllerName
        if let range = viewControllerName.range(of: "ViewController") {
            return String(viewControllerName[..<range.lowerBound])
        } else {
            return controllerName
        }
    }

    /// Attempts to asynchronously open the resource at the specified URL.
    /// - Parameters:
    ///   - url: A URL (Universal Resource Locator).
    ///   - completion: The block to execute with the results.
    func openIfPossible(url: URL, completion: ((Bool) -> Void)? = nil) {
        if canOpenURL(url) {
            open(url, completionHandler: completion)
        }
    }

    /// Attempts to asynchronously open the resource at the specified URL.
    /// - Parameters:
    ///   - url: String representation of the URL.
    ///   - completion: The block to execute with the results.
    func openIfPossible(urlString: String, completion: ((Bool) -> Void)? = nil) {
        if let url = URL(string: urlString) {
            openIfPossible(url: url, completion: completion)
        }
    }
}
