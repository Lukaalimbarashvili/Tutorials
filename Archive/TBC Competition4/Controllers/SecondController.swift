//
//  SecondController.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class SecondController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fm = FileManager.default
    
    var  mainPath: URL {
        return try! fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var images = [URL]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
        
        tableView.delegate   = self
        tableView.dataSource = self
        
        contentsOf(url: mainPath)
    }


    
    func contentsOf(url: URL)  {
            images = try! fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
    }
           
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as! SecondCell
        
        let imageData:NSData = NSData(contentsOf: images[indexPath.row])!

        let image = UIImage(data: imageData as Data)

        cell.immageView.image = image
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        try! fm.removeItem(at: images[indexPath.row])
        images.remove(at: indexPath.row)
        
        tableView.reloadData()


//                        let detailVC = storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
//                detailVC.image = images[indexPath.row]
//                self.present(detailVC, animated: true, completion: nil)
    }
    
    
    
    
}
