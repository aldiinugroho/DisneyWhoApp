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
    var collectionView: UICollectionView!
    let collectionViewFlowlayout = UICollectionViewFlowLayout()
    var dataresponsetemp: [data] = []
    var stringtest: String = ""
    var datautamatoshow: [MainViewControllerCell.modelView] = []
    
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
         // make sure that there is a slightly larger gap at the top of each row
//         collectionViewFlowlayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
         // set a standard item size of 60 * 60
//        collectionViewFlowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.width/4.5)
        // the layout scrolls horizontally
        collectionViewFlowlayout.scrollDirection = .vertical
        collectionViewFlowlayout.minimumLineSpacing = 0
        collectionViewFlowlayout.minimumInteritemSpacing = 0
        // set the frame and layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowlayout)
        collectionView.register(MainViewControllerCell.self, forCellWithReuseIdentifier: MainViewControllerCell().identifierId)
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.collectionViewHeaderId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = appColor
        collectionView.contentInsetAdjustmentBehavior = .never
//        collectionView.backgroundColor = .systemPink
        // set the view to be this UICollectionView
        view = collectionView
    }
    
    private func layout() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datautamatoshow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        let data = self.datautamatoshow[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewControllerCell().identifierId, for: indexPath) as! MainViewControllerCell
        cell.configure(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenrect = UIScreen.main.bounds
        let screenwidth = screenrect.width
        let cellWidth = screenwidth / 4
        let size = CGSizeMake(cellWidth, cellWidth+12)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.collectionViewHeaderId, for: indexPath) as! CollectionViewHeader
            return view
        default:
            assert(false, "Unexpected")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedview = self.datautamatoshow[indexPath.item]
        let view = DetailViewController()
        let datatoshow = DetailViewController.modelView(titlename: selectedview.text, imageUrl: selectedview.image, filmArray: selectedview.filmarray)
        view.configure(with: datatoshow)
        navigationController?.pushViewController(view, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(view.frame.width, view.frame.height/2)
    }
}

extension MainViewController {
    
    private func fetchingdata() {
        datautamatoshow = [
            MainViewControllerCell.modelView(color: UIColor.purple, text: "-", image: "https://www.befunky.com/images/prismic/67fab425-8f93-42f5-a4b0-4e19c2119500_hero-photo-editor.jpg?auto=avif,webp&format=jpg&width=896", filmarray: [])
        ]
        fetchListCharacters() { result in
            switch result {
            case .success(let success):
//                print(success)
                self.settupdatacollection(with: success)
                self.collectionView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func settupdatacollection(with: [data]) {
//        print(with)
        datautamatoshow = with.map {
            MainViewControllerCell.modelView(color: appColor, text: $0.name, image: $0.imageUrl, filmarray: $0.films)
        }
    }
}
