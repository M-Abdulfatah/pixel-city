//
//  PopVC.swift
//  pixel-city
//
//  Created by Mahmoud Mohammed on 8/12/18.
//  Copyright © 2018 Mahmoud Mohammed. All rights reserved.
//

import UIKit

class PopVC: UIViewController, UIGestureRecognizerDelegate {
    
   
    @IBOutlet weak var popImageView: UIImageView!

    
    private(set) var passedImage: UIImage!
    private(set) var imageArray: [UIImage]!
    
    func initData(forImage image: UIImage, imageArrat imgArrat: [UIImage]) {
        self.passedImage = image
        self.imageArray = imgArrat
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popImageView.image = passedImage
        addDoubleTap()
    }
    
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
