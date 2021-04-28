//
//  UICollectionView+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 24.12.2020.
//  Copyright © 2020 Mobven. All rights reserved.

import Foundation
import UIKit

public extension UITableView {
    /// Registers a nib object containing a cell with the table view under a specified identifier.
    /// - Parameters:
    ///   - type: Type of the cell with same identifer as its class name.
    ///   - bundle: The bundle in which to search for the nib file.
    func registerNib(_ type: UITableViewCell.Type, bundle: Bundle) {
        register(
            UINib(nibName: type.identifier, bundle: bundle),
            forCellReuseIdentifier: type.identifier
        )
    }

    /// Registers a nib object containing a header or footer with the table view under a specified identifier.
    /// - Parameters:
    ///   - type: Type of the supplementary view with same identifer as its class name.
    ///   - bundle: The bundle in which to search for the nib file.
    func registerHeaderFooter(_ type: UITableViewHeaderFooterView.Type, bundle: Bundle) {
        register(
            UINib(nibName: type.identifier, bundle: bundle),
            forHeaderFooterViewReuseIdentifier: type.identifier
        )
    }

    /// Resize tableViewHeaderView to fit size.
    func updateHeaderViewHeight() {
        if let header = tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
}

public extension UITableView {
    /// Dequeue cells with reuse identifier same as the its class name.
    /// Use with `registerNib(type:,bundle)`.
    /// - Returns: Returns cell which is registered with the reuse identifer same as cell class.
    func dequeueCell<CellType: UITableViewCell>() -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.identifier) as? CellType else {
            fatalError("Wrong type of cell")
        }
        return cell
    }

    /// Dequeue cells with reuse identifier same as the its class name.
    /// Use with `registerNib(type:,bundle)`.
    /// - Parameter indexPath: Index path of the cell.
    /// - Returns: Returns cell which is registered with the reuse identifer same as cell class.
    func dequeueCell<CellType: UITableViewCell>(indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Wrong type of cell")
        }
        return cell
    }

    /// Dequeue header footer view with reuse identifier same as the its class name.
    /// Use with `registerHeaderFooter(type:,bundle)`.
    /// - Parameter indexPath: Index path of the cell.
    /// - Returns: Returns header footer view which is registered with the reuse identifer same as its class.
    func dequeueHeaderFooterView<ViewType: UITableViewHeaderFooterView>() -> ViewType {
        guard let headerView = dequeueReusableHeaderFooterView(withIdentifier: ViewType.identifier) as? ViewType else {
            fatalError("Wrong type of header view")
        }
        return headerView
    }
}
