//
//  FullImageCell.swift
//  pixel-city
//
//  Created by Mahmoud Mohammed on 8/26/18.
//  Copyright © 2018 Mahmoud Mohammed. All rights reserved.
//

import UIKit

class FullImageCell: UICollectionViewCell, UIScrollViewDelegate {
    fileprivate var scrollImg: UIScrollView!
    fileprivate var imgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollImg = UIScrollView()
        scrollImg.delegate = self
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = true
        scrollImg.flashScrollIndicators()
    
        self.addSubview(scrollImg)
        
        imgView = UIImageView()
        imgView.image = UIImage(named: "user3")
        scrollImg.addSubview(imgView!)
        imgView.contentMode = .scaleAspectFit
    }
    
    func configureCell(for image: UIImage) {
        imgView.image = image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollImg.frame = self.bounds
        imgView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
