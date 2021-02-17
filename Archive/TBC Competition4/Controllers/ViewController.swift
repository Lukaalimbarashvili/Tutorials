//
//  ViewController.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
typealias CollectionViewNeccessities = UICollectionViewDelegate & UICollectionViewDataSource

class ViewController: UIViewController, CollectionViewNeccessities {
    
    var user : userApi?
    
    
    var index = 0
    
    let apiResponse = APIResponse()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiResponse.getImages { (userApi) in
            self.user = userApi
            print(userApi)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func onGallery(_ sender: UIBarButtonItem) {
        let galleryVC = storyboard?.instantiateViewController(identifier: "SecondController") as! SecondController
        navigationController?.pushViewController(galleryVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let users = user?.results[indexPath.row]
        cell.titleLabel.text = users?.user.name
        users?.urls.small.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        })
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.index = indexPath.row
        showAlert()
    }
    
    func showAlert(){
        let actionSheet = UIAlertController(title: "Photo Quality", message: "Choose photo quality", preferredStyle: .actionSheet)
        
        let highAction = UIAlertAction(title: "High", style: .default) { UIAlertAction in
            self.user?.results[self.index].urls.full.downloadImage(completion: { (image) in
                self.saveImage(image: image!, quality: "High")
                
            })
            
        }
        
        let mediumAction = UIAlertAction(title: "Medium", style: .default) { UIAlertAction in
            self.user?.results[self.index].urls.regular.downloadImage(completion: { (image) in
               self.saveImage(image: image!, quality: "Medium")
                
            })
        }
        
        let lowAction = UIAlertAction(title: "Low", style: .default) { UIAlertAction in
            self.user?.results[self.index].urls.small.downloadImage(completion: { (image) in
                self.saveImage(image: image!, quality: "Low")
                
            })
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(highAction)
        actionSheet.addAction(mediumAction)
        actionSheet.addAction(lowAction)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true)
    }
    
    
    
    func saveImage(image: UIImage, quality: String) {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return
        }
        guard let directory = try? FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        
 
        
        let imgName = "\(index)\(quality).png"
        
        do {
            try data.write(to: directory.appendingPathComponent("\(imgName)")!)
            print(directory)
            return
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    

}


