//
//  MainViewControllerCell.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 14/12/22.
//

import Foundation
import UIKit

class MainViewControllerCell: UICollectionViewCell {
    
    struct modelView {
        let color: UIColor
        let text: String
        let image: String
        let filmarray: Array<String>
    }
    
    let identifierId: String = "MainViewControllerCell_identifier"
    let titleText: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewControllerCell {
    private func setup() {
        self.addSubview(titleText)
        self.addSubview(imageView)
    }
    
    private func layout() {
        // titleText
        NSLayoutConstraint.activate([
            titleText.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleText.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: titleText.trailingAnchor, multiplier: 2)
        ])
        
        // resp
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 2),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
//            imageView.bottomAnchor.constraint(equalTo: titleText.topAnchor)
        ])
    }
}

extension MainViewControllerCell {
    func configure(data: modelView) {
        titleText.text = data.text
        imageView.downloaded(from: data.image, contentMode: .scaleToFill)
    }
}
