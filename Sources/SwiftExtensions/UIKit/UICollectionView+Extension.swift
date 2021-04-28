//
//  UICollectionView+Extension.swift
//  SwiftExtensions
//
//  Created by Rashid Ramazanov on 24.12.2020.
//

import Foundation
import UIKit

public extension UICollectionView {
    /// Registers a nib file for use in creating new collection view cells.
    /// - Parameters:
    ///   - type: Type of the cell with same identifer as its class name.
    ///   - bundle: The bundle in which to search for the nib file.
    func registerNib(_ type: UICollectionViewCell.Type, bundle: Bundle) {
        register(
            UINib(nibName: type.identifier, bundle: bundle),
            forCellWithReuseIdentifier: type.identifier
        )
    }
    /// Registers a nib file for use in creating supplementary views for the collection view.
    /// - Parameters:
    ///   - type: Type of the supplementary view with same identifer as its class name.
    ///   - bundle: The bundle in which to search for the nib file.
    func registerHeader(_ type: UICollectionReusableView.Type, bundle: Bundle) {
        register(
            UINib(nibName: type.identifier, bundle: bundle),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier
        )
    }
}

public extension UICollectionView {
    /// Dequeue cells with reuse identifier same as the its class name.
    /// Use with `registerNib(type:,bundle)`.
    /// - Parameter indexPath: Index path of the cell.
    /// - Returns: Returns cell which is registered with the reuse identifer same as cell class.
    func dequeueCell<CellType: UICollectionViewCell>(indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: CellType.identifier, for: indexPath
        ) as? CellType else {
            fatalError("Wrong type of cell")
        }
        return cell
    }

    /// Dequeue supplementary with reuse identifier same as the its class name.
    /// Use with `registerHeader(type:,bundle)`.
    /// - Parameter indexPath: Index path of the cell.
    /// - Returns: Returns supplementary view which is registered with the reuse identifer same as its class.
    func dequeueHeaderView<ViewType: UICollectionReusableView>(indexPath: IndexPath) -> ViewType {
        guard let headerView = dequeueReusableSupplementaryView(
            ofKind:
            UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ViewType.identifier,
            for: indexPath
        ) as? ViewType else {
            fatalError("Wrong type of header view")
        }
        return headerView
    }
}
