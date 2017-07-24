//
//  MemeController.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class MemeController{
    
    static let shared = MemeController()
    
    var memes: [Meme] = []
    
    func createAndSaveMemeWith(image: UIImage, firstText: String, secondText: String)  {
        let meme = Meme(image: image, firstText: firstText, secondText: secondText)
        self.memes.append(meme)
    }
    
    
}
