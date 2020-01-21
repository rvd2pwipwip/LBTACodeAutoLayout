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
        setUpTopImageContainerView()
        setUpBearImageView()
        setUpDescriptionTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let topImageContainerView: UIView = {
        let ticv = UIView()
        ticv.translatesAutoresizingMaskIntoConstraints = false
        return ticv
    }()
    
    let bearImageView: UIImageView = { // create ui component
        let iv = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        iv.translatesAutoresizingMaskIntoConstraints = false // enable auto layout on iv
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let descriptionTextView: UITextView = {
        let dtv = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
        ])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]))

        dtv.translatesAutoresizingMaskIntoConstraints = false
        dtv.attributedText = attributedText
        dtv.textAlignment = .center
        dtv.isEditable = false
        dtv.isScrollEnabled = false
        return dtv
    }()
    
    fileprivate func setUpTopImageContainerView() {
        addSubview(topImageContainerView)
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topImageContainerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func setUpBearImageView() { //set ui component constraints
        backgroundColor = .white
        topImageContainerView.addSubview(bearImageView) // add image component as subview of topImageContainerView
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func setUpDescriptionTextView() {
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
