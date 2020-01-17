//
//  ViewController.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-15.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopImageContainerView()
        setUpBearImageView()
        setUpDescriptionTextView()
    }
    
    let topImageContainerView: UIView = {
        let ticv = UIView()
//        ticv.backgroundColor = .blue
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
//        dtv.text = "Join us today in our fun and games!"
//        dtv.font = UIFont.boldSystemFont(ofSize: 18)
        dtv.textAlignment = .center
        dtv.isEditable = false
        dtv.isScrollEnabled = false
        return dtv
    }()
    
    let previousButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    fileprivate func setUpBearImageView() { //set ui component constraints
        view.backgroundColor = .white
        topImageContainerView.addSubview(bearImageView) // add image component as subview of topImageContainerView
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func setUpDescriptionTextView() {
        view.addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func setUpTopImageContainerView() {
        view.addSubview(topImageContainerView)
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }

}

