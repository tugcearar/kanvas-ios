//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import UIKit

/// Collection view for ThumbnailCollectionController
final class ThumbnailCollectionView: UIView {
    
    private let layout: ThumbnailCollectionViewLayout
    let collectionView: UICollectionView
    
    var cellWidth: CGFloat {
        set {
            layout.estimatedItemSize.width = newValue
        }
        get {
            layout.estimatedItemSize.width
        }
    }
    
    init() {
        layout = ThumbnailCollectionViewLayout()
        collectionView = ThumbnailInnerCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.accessibilityIdentifier = "Thumbnail Collection View"
        collectionView.backgroundColor = .clear
        
        super.init(frame: .zero)
        
        clipsToBounds = true
        setUpViews()
    }
    
    @available(*, unavailable, message: "use init() instead")
    override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setUpViews() {
        collectionView.add(into: self)
        collectionView.clipsToBounds = true
    }
}


private class ThumbnailInnerCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        isScrollEnabled = false
        allowsSelection = false
        bounces = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        autoresizesSubviews = true
        contentInset = .zero
        dragInteractionEnabled = false
    }
}

private class ThumbnailCollectionViewLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        scrollDirection = .horizontal
        itemSize = UICollectionViewFlowLayout.automaticSize
        estimatedItemSize = CGSize(width: ThumbnailCollectionCell.cellWidth, height: ThumbnailCollectionCell.cellHeight)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
}