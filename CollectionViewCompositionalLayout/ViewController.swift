//
//  ViewController.swift
//  CollectionViewCompositionalLayout
//
//  Created by Sumayya Siddiqui on 10/03/23.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate {
    
    var images: [String] = ["Fruits", "Organic", "Supermarket", "Bakery", "Fruits", "Organic", "Supermarket", "Bakery","Fruits", "Organic", "Supermarket", "Bakery"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
        
        let fullItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 1)
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: fullItem, count: 2)
        
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.6), items: [item, verticalGroup])
        
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.4), spacing: 1)
        let mainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.5), items: [mainItem, horizontalGroup])
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }

}


extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        cell.myImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    
}

