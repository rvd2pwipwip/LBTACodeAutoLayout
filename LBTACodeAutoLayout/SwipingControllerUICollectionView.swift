//
//  SwipingControllerUICollectionView.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-22.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

extension SwipingController {
        //set number of items in collection view
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return pages.count
        }
        //set the cells
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell // casting UICollectionViewCell as PageCell
    //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
            let page = pages[indexPath.item]
            cell.page = page
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
        
}
