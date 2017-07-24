//
//  MemeImagesCollectionViewCell.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class MemeImagesCollectionViewCell: UICollectionViewCell {
    
    var imageIndex: Int = 0
 
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    
    @IBAction func imageButtonTapped(_ sender: Any) {
        delegate?.memeImageButtonTappped(cell: self)
    }
    
    weak var delegate: MemeImageSelectedDelegate?
}


protocol MemeImageSelectedDelegate: class {
    func memeImageButtonTappped(cell: MemeImagesCollectionViewCell)
}
