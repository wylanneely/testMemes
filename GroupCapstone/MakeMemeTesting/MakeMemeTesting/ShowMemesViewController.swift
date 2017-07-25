//
//  ShowMemesViewController.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ShowMemesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        MemeController.shared.fetchMemesFromCLoudKit {
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
       //ADD POPVIEWCONTROLLER
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    @IBAction func reloadButtonTapped(_ sender: Any) {
        self.collectionView.reloadData()
    }

}
