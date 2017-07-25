//
//  Meme.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CloudKit

class Meme {
    //MARK: - CloudKit Keys
    static let cKRecordTypeKey = "Meme"
    
    private let kImageData = "ImageData"
    private let kFirstText = "firstText"
    private let kSecondText = "secondText"
    
    var cloudKitRecord: CKRecord {
        
        let record = CKRecord(recordType: Meme.cKRecordTypeKey)
        
        record.setValue(imageData, forKey: kImageData)
        record.setValue(firstText, forKey: kFirstText)
        record.setValue(secondText, forKey: kSecondText)
        
        return record
    }
    
    
    let image: UIImage?
    let imageData: Data
    var firstText: String
    var secondText: String
    
    init(imageData: Data, firstText: String, secondText: String ) {
        self.imageData = imageData
        self.firstText = firstText
        self.secondText = secondText
        
        self.image = UIImage(data: imageData)
        
    }
    
    
    init?(cloudKitRecord: CKRecord){
        
        guard let imageData = cloudKitRecord[kImageData] as? Data,
        let firstText = cloudKitRecord[kFirstText] as? String,
            let secondText = cloudKitRecord[kSecondText] as? String
        else { return nil }
        
       
        
        
        //FIX
            self.imageData = imageData
            self.firstText = firstText
            self.secondText = secondText
        self.image = UIImage(data: imageData)
        
        
        
        
    }
    
}
