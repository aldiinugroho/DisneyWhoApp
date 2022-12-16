//
//  DetailViewController.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 15/12/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    struct modelView {
        let titlename: String
        let imageUrl: String
        let filmArray: Array<String>
    }
    
    var datafilm: Array<String> = []
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isScrollEnabled = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    let titleName: UILabel = {
        let label = UILabel()
        label.text = "TEST NAME"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filmLabel: UILabel = {
        let label = UILabel()
        label.text = "Films"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "sampleimage")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .systemPink
        iv.clipsToBounds = true
        iv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        iv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let scrollviewfilm: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .purple
        sv.isScrollEnabled = true
        sv.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataBinding()
        setup()
        layout()
    }
}

extension DetailViewController {
    
    private func setupDataBinding() {
        
    }
    
    private func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleName)
        scrollView.addSubview(filmLabel)
        scrollView.addSubview(stackView)
        
        for i in datafilm {
            let ul = UILabel()
            ul.text = "+ \(i)"
            ul.textColor = .white
            stackView.addArrangedSubview(ul)
        }
    }
    
    private func layout() {
        // scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // titleName
        NSLayoutConstraint.activate([
            titleName.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            titleName.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleName.trailingAnchor, multiplier: 2)
        ])
        
        // filmLabel
        NSLayoutConstraint.activate([
            filmLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleName.bottomAnchor, multiplier: 2),
            filmLabel.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            filmLabel.trailingAnchor.constraint(equalTo: titleName.trailingAnchor)
        ])
        
        // scrollviewfilm
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: filmLabel.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalTo: filmLabel.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: filmLabel.trailingAnchor)
        ])
    }
}

extension DetailViewController {
    func configure(with: modelView) {
        titleName.text = with.titlename
        imageView.downloaded(from: with.imageUrl)
    }
}
