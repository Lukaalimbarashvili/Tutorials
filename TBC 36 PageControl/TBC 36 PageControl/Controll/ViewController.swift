//
//  ViewController.swift
//  TBC 36 PageControl
//
//  Created by Sandroshvili on 6/8/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

typealias CollectionViewNeccessities = UICollectionViewDelegateFlowLayout & UICollectionViewDelegate & UICollectionViewDataSource

class ViewController: UIViewController, CollectionViewNeccessities {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages = [Page]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        setupPages()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onSkip(_ sender: UIButton) {
        let resultVC = storyboard?.instantiateViewController(identifier: "ResultController") as! ResultController
        navigationController?.pushViewController(resultVC, animated: true)
    }
    @IBAction func onNext(_ sender: UIButton) {
        if pageControl.currentPage == 2 {
            let resultVC = storyboard?.instantiateViewController(identifier: "ResultController") as! ResultController
            navigationController?.pushViewController(resultVC, animated: true)
        }
        let index = IndexPath(item: 1, section: 0)
        let index2 = IndexPath(item: 2, section: 0)
        if pageControl.currentPage == 0 {
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 1
        } else {
            collectionView.scrollToItem(at: index2, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 2
        }
        

        
    }
    
    private func setupPages() {
        let page1 = Page(imageNamed: "first", title: "Online shopping", text: "Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price")
        
        let page2 = Page(imageNamed: "second", title: "Add to cart", text: "Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons")
        
        let page3 = Page(imageNamed: "third", title: "Payment Successful", text: "Your payment has been successfully completed. You will receive a confirmation email within a few minutes. ")
        
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        
        
        pageControl.numberOfPages = self.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        
        cell.imageView.image       = page.image
        cell.titleLabel.text       = page.title
        cell.descriptionLabel.text = page.text
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = targetContentOffset.pointee
        let x = offset.x

        let pageIndex = x / collectionView.frame.width
        pageControl.currentPage = Int(pageIndex)
    }

}

