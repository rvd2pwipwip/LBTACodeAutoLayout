//
//  SwipingController.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-20.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId") // register cell with identifier
        collectionView.isPagingEnabled = true // snap to pages when swapping
        
    }
    
    //set number of items in collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //set the cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
