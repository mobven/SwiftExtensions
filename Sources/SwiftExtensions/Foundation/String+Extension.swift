//
//  String+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 30.12.2020.
//

import Foundation
import UIKit

public extension String {
    /// Returns true if string is in  the characters in Unicode General Categories L*, M*, and N*.
    var isAlphaNumeric: Bool {
        rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
            && !isEmpty
    }

    var isNumeric: Bool {
        rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
            && !isEmpty
    }

    func htmlAttributedString(font: UIFont, color: UIColor) -> NSAttributedString? {
        let modifiedString = """
        <style>
            body {
                font-family: '\(font.fontName)';
                font-size:\(font.pointSize)px;
                color: \(color.hexString);
            }
        </style>\(self)
        """
        guard let data = modifiedString.data(using: .utf8) else { return nil }
        guard let string = try? NSMutableAttributedString(
            data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil
        ) else { return nil }
        return string
    }

    var withoutSpecialCharacters: String {
        components(separatedBy: CharacterSet.symbols).joined(separator: "")
    }

    var withoutSpecialCharactersAndSpace: String {
        withoutSpecialCharacters.replacingOccurrences(of: " ", with: "")
    }

    var withoutWhitespacesAndNewlines: String {
        trimmingCharacters(in: .whitespaces)
    }
}
