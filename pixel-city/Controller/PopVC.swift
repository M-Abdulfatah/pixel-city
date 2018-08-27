//
//  PopVC.swift
//  pixel-city
//
//  Created by Mahmoud Mohammed on 8/12/18.
//  Copyright © 2018 Mahmoud Mohammed. All rights reserved.
//

import UIKit

class PopVC: UIViewController {
    
    // MARK: - Properties
    fileprivate var myCollectionView: UICollectionView!
    fileprivate var passedContentOffset = IndexPath()
    fileprivate var imageArray: [UIImage]!
    fileprivate let screenHight = UIScreen.main.bounds.height
    fileprivate let screenWidth = UIScreen.main.bounds.width
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        addDoubleTap()
        addDoubleTapView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       setupCollectionViewLayout()
    }
    
    override func viewDidLayoutSubviews() {
        myCollectionView.scrollToItem(at: passedContentOffset, at: .left, animated: false)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let offset = myCollectionView.contentOffset
        let width  = myCollectionView.bounds.size.width
        
        let index = round(offset.x / width)
        let newOffset = CGPoint(x: index * size.width, y: offset.y)
        
        myCollectionView.setContentOffset(newOffset, animated: false)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.myCollectionView.reloadData()
            
            self.myCollectionView.setContentOffset(newOffset, animated: false)
        }, completion: nil)
    }
    
    // MARK: - Helper Methods
    func initData(forIndexPath indexPath: IndexPath, imageArray imgArrat: [UIImage]) {
        self.passedContentOffset = indexPath
        self.imageArray = imgArrat
    }
    
    // MARK: - Double-tab SubView
    func addDoubleTapView() {
        let doubleTabView = UIView(frame: CGRect(x: screenWidth / 2 - 100.0, y: screenHight - 60.0, width: 200.0, height: 25.0))
        doubleTabView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 25.0))
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        label.text = "Double-tap to dismiss"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        
        doubleTabView.addSubview(label)
        self.view.addSubview(doubleTabView)
    }
}

    // MARK: - Collection View Setup
extension PopVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setUpCollectionView() {
        self.view.backgroundColor=UIColor.black
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing=0
        layout.minimumLineSpacing=0
        layout.scrollDirection = .horizontal
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(FullImageCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
        myCollectionView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
    }
    
    func setupCollectionViewLayout() {
        guard let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        flowLayout.itemSize = myCollectionView.frame.size
        
        flowLayout.invalidateLayout()
        
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FullImageCell else { return UICollectionViewCell() }
        cell.configureCell(for: imageArray[indexPath.row])
        return cell
    }
}

// MARK: - Tap Geustures
extension PopVC: UIGestureRecognizerDelegate{
    func addDoubleTap() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(screenWasDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        view.addGestureRecognizer(doubleTap)
    }
    
    @objc func screenWasDoubleTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
