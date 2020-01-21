//
//  PageCell.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-20.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
