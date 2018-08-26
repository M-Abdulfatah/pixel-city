//
//  PhotoCell.swift
//  pixel-city
//
//  Created by Mahmoud Mohammed on 8/11/18.
//  Copyright © 2018 Mahmoud Mohammed. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    func configureCell(image: UIImage) {
        cellImage.image = image
    }
    
}
