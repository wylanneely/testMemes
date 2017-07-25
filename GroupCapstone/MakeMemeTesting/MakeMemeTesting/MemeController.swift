//
//  MemeController.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CloudKit

class MemeController{
    
    static var shared = MemeController()
    
    
     let memesWereUpdatedNotification = Notification.Name("MemesWereUpdated")
     var memes: [Meme] = [] 
    
    //create
     func createMeme(image: UIImage, firstText: String, secondText: String)  {
        
        
        guard let photoData = UIImagePNGRepresentation(image) as NSData? else {
            return
        }
        
        let meme = Meme(imageData: photoData as Data, firstText: firstText, secondText: secondText)
        
        saveToCloudKit(meme: meme)
        
    }
    
    //save
     func saveToCloudKit(meme: Meme) {
        
        CKContainer.default().publicCloudDatabase.save(meme.cloudKitRecord) { (record, error) in
            if let error = error { NSLog("Error Saving Record to CLOUDKIT: \(error.localizedDescription) ") }
            else { self.memes.append(meme) }
        }
    }
    
    //fetch
    
    func fetchMemesFromCLoudKit(completion: @escaping () -> Void){
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: Meme.cKRecordTypeKey, predicate: predicate)
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error { NSLog("Error Fetching from CLOUTKIT: \(error.localizedDescription)")}
            guard let records = records else { return }
            
            let memes = records.flatMap({ Meme(cloudKitRecord: $0) })
            
            self.memes = memes
            }
    
    }
    
    
    
    static func subscribeToMemeCreations() {
        let predicate = NSPredicate(value: true)
        let subscription = CKQuerySubscription(recordType: Meme.cKRecordTypeKey, predicate: predicate, options: .firesOnRecordCreation)
        let notificationInfo = CKNotificationInfo()
        notificationInfo.alertBody = "A New Meme Has Been Created!"
        notificationInfo.soundName = "default"
        notificationInfo.shouldSendContentAvailable = true
        subscription.notificationInfo = notificationInfo
        CKContainer.default().publicCloudDatabase.save(subscription) { (_, error) in
            if let error = error { NSLog("Error Subscribing to Creation of Memes: \(error.localizedDescription)") }
        }
    }
    
}
