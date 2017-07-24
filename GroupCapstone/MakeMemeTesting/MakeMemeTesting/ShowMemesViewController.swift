//
//  ShowMemesViewController.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ShowMemesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
       //ADD POPVIEWCONTROLLER
    @IBAction func backButtonTapped(_ sender: Any) {
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return MemeController.shared.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath) as? MemeCollectionViewCell else { return UICollectionViewCell()}
        let meme =  MemeController.shared.memes[indexPath.row]

        cell.memeImageView.image = meme.image
        cell.firstTestLabel.text = meme.firstText
        cell.secondTextLabel.text = meme.secondText
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
