//
//  ViewController.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class HomeController: UIViewController, TableViewNeccessities, StoryDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    
    var stories = [StoryModel]()
    var selectedStory: Int?
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(seen),
        name: NSNotification.Name(rawValue: "StoryID"),
        object: nil)
        
        stories = viewModel.getStories()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        

    }

    @IBAction func onWatchAll(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowStory", sender: self)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 622
        }
        return 150
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let id = segue.identifier, id == "ShowStory"{
                if let storiesVC = segue.destination as? StoryController {
                    storiesVC.stories = self.stories
                    storiesVC.selectedStory = self.selectedStory ?? 0
                }
            }
        }
    
    @objc func seen(with notification: Notification){
        if let info = notification.userInfo{
            
            let index = info["index"] as? Int
            let story = info["story"] as? StoryModel
            
            self.stories[index!] = story!
            
            
        }
    }
    
    func getStory(index: Int) {
        selectedStory = index
        performSegue(withIdentifier: "ShowStory", sender: self)
    }
    


}

