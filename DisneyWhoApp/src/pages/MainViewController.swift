//
//  MainViewController.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 12/12/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    // MARK: - declaration
    var data = [UIColor.red,UIColor.orange,UIColor.blue,UIColor.brown]
    var collectionView: UICollectionView!
    let collectionViewFlowlayout = UICollectionViewFlowLayout()
    
    // MARK: - component life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        fetchingdata()
    }
}

extension MainViewController {
    private func setup() {
        // make sure that there is a slightly larger gap at the top of each row
//         collectionViewFlowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // set a standard item size of 60 * 60
//        collectionViewFlowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width/3.5, height: 60)
        // the layout scrolls horizontally
        collectionViewFlowlayout.scrollDirection = .vertical
        collectionViewFlowlayout.minimumLineSpacing = 0
        collectionViewFlowlayout.minimumInteritemSpacing = 0
        // set the frame and layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowlayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
//        collectionView.backgroundColor = .systemPink
        // set the view to be this UICollectionView
        view = collectionView
    }
    
    private func layout() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data = self.data[indexPath.item]
        cell.backgroundColor = data
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenrect = UIScreen.main.bounds
        let screenwidth = screenrect.width
        let cellWidth = screenwidth / 3
        let size = CGSizeMake(cellWidth, cellWidth)
        return size
    }
}

extension MainViewController {
    func fetchingdata() {
        Networkings().fetchListCharacters() { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
