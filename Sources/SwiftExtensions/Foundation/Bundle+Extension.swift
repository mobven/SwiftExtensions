//
//  Bundle+Extension.swift
//  SwiftExtensions
//
//  Created by Rasid Ramazanov on 13.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

/// Bundle extension
public extension Bundle {
    /// Returns String value for the specified key from bundle dictionary.
    /// - Parameter key: String representing item key.
    /// - Returns: String value if exists.
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }

    /// Returns boolean value with specified key from bundle dictionary.
    /// - Parameter key: String representing item key.
    /// - Returns: Boolean value. If key does not exist, `false` will be returned.
    func boolForKey(_ key: String) -> Bool {
        infoForKey(key) == "YES"
    }
}
