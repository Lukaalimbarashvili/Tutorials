//
//  HeaderCell.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    var didSelectItemEvent: ((IndexPath) -> Void)?
    var fromVC: UIViewController?
    var pages = [Page]()
    let viewModel = ViewModel()
    var stories = [StoryModel]()
    var delegate: StoryDelegate?
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var storyCollection: UICollectionView!
    @IBOutlet weak var boardingCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stories = viewModel.getStories()
        pages   = viewModel.getPages()
        boardingCollection.delegate = self
        boardingCollection.dataSource = self
        
        storyCollection.delegate = self
        storyCollection.dataSource = self
        storyCollection.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(seen(with:)),
            name: NSNotification.Name(rawValue: "StoryID"),
            object: nil)
            }
        
            @objc func seen(with notification: Notification){
            if let info = notification.userInfo{
                
                let index = info["index"] as? Int
                let story = info["story"] as? StoryModel
                
                self.stories[index!] = story!
                storyCollection.reloadData()
            }
        
        pageControl.numberOfPages = self.pages.count
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func onLeft(_ sender: UIButton) {
        
        let zeroindex = IndexPath(item: 0, section: 0)
        let index  = IndexPath(item: 1, section: 0)
        
        if pageControl.currentPage == 2 {
            boardingCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 1
        } else {
            boardingCollection.scrollToItem(at: zeroindex, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 0
        }
        
    }
    @IBAction func onRight(_ sender: UIButton) {
        
        let index  = IndexPath(item: 1, section: 0)
        let index2 = IndexPath(item: 2, section: 0)
        if pageControl.currentPage == 0 {
            boardingCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 1
        } else {
            boardingCollection.scrollToItem(at: index2, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 2
        }
    }
    
}

extension HeaderCell : CollectionViewNeccessities {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == boardingCollection {
            return 3
        }
        return stories.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == boardingCollection {
            let cell = boardingCollection.dequeueReusableCell(withReuseIdentifier: "BoardingCell", for: indexPath) as! BoardingCell
            let page = pages[indexPath.row]
            
            cell.imageView.image = page.image
            cell.titleLabel.text = page.title
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        let story = stories[indexPath.row]
        cell.imageView.image = UIImage(named: story.image)
        cell.userLabel.text = story.fullname
        
        cell.imageView.layer.masksToBounds = false
        cell.imageView.layer.borderWidth = 4
        
        if story.seen {
            cell.layeruka.strokeColor = UIColor.gray.cgColor
        } else{
            cell.layeruka.strokeColor = UIColor.red.cgColor
        }
        
        cell.imageView.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == boardingCollection {
            return .init(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        return .init(width: 172/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == boardingCollection {
            return 0
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == boardingCollection {
            return .init(top: 0, left: 15, bottom: 0, right: 190)
        }
        return .init(top: 0, left: 30, bottom: 0, right: 90)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == storyCollection {
            delegate?.getStory(index: indexPath.row)
        }
        
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = targetContentOffset.pointee
        let x = offset.x
        
        let pageIndex = x / boardingCollection.frame.width
        pageControl.currentPage = Int(pageIndex)
    }
    
    
}

