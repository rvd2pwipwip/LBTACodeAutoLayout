//
//  SwipingController.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-20.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        PageModel(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        PageModel(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        PageModel(imageName: "leaf_third", headerText: "VIP members special services", bodyText: ""),
        PageModel(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        PageModel(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        PageModel(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId") // register cell with identifier
        collectionView.isPagingEnabled = true // snap to pages when swapping
        setUpBottomControls()
    }
    
    let previousButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Prev".uppercased(), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(UIColor(named: "pinkColor"), for: .normal)
        btn.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return btn
    }()
    
    private lazy var pageControl: UIPageControl = { // lazy var to access other class members?
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor(named: "pinkColor")
        pc.pageIndicatorTintColor = UIColor(named: "pinkColor")?.withAlphaComponent(0.3)
        return pc
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Next".uppercased(), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(UIColor(named: "pinkColor"), for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()
    
    @objc private func handlePrevious() {
        let previousIndex = pageControl.currentPage > 0 ? pageControl.currentPage - 1 : pages.count - 1 // loop pages
//        let previousIndex = max(pageControl.currentPage - 1, 0) // stop at last page
        let indexPath = IndexPath(item: previousIndex, section: 0)
        pageControl.currentPage = previousIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext() {
        let nextIndex = pageControl.currentPage < pages.count - 1 ? pageControl.currentPage + 1 : 0 // loop pages
//        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1) // stop at last page
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let bottomControlsStackView: UIStackView = {
        let bcsv = UIStackView()
        bcsv.translatesAutoresizingMaskIntoConstraints = false
        bcsv.distribution = .fillEqually
        return bcsv
    }()
    
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
//        print(x, view.frame.width, x / view.frame.width)
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    fileprivate func setUpBottomControls() {
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.addArrangedSubview(previousButton)
        bottomControlsStackView.addArrangedSubview(pageControl)
        bottomControlsStackView.addArrangedSubview(nextButton)
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
