//
//  SwipingControllerExtension.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-22.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

extension SwipingController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionView.collectionViewLayout.invalidateLayout() // cancel portrait layout constraints
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0) // get current page
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true) // animate scroll to current page
        }) { (_) in
            
        }
        
    }
    
}
