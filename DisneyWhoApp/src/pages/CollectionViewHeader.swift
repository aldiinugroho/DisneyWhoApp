//
//  CollectionViewHeader.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 15/12/22.
//

import Foundation
import UIKit
class CollectionViewHeader: UICollectionReusableView {
    
    // MARK: - declaration
    static let collectionViewHeaderId: String = "CollectionViewHeader"
    
    let imageview: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "headerimage")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - component life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewHeader {
    private func setup() {
//        self.backgroundColor = .white
        self.addSubview(imageview)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: self.topAnchor),
            imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
