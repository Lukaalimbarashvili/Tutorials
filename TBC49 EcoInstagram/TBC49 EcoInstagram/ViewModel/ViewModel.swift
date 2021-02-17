//
//  ViewModel.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class ViewModel{
    var stories = [StoryModel]()
    
     func getStories() -> [StoryModel] {
        var stories = [StoryModel]()
        stories.append(StoryModel(fullname: "იგისგან", image: "story1"))
        stories.append(StoryModel(fullname: "სწორედ", image: "story2"))
        stories.append(StoryModel(fullname: "ის დარჩა", image: "story3"))
        stories.append(StoryModel(fullname: "რაც იგიში", image: "story4"))
        stories.append(StoryModel(fullname: "იგი იყო", image: "story5"))
        stories.append(StoryModel(fullname: "ბრავო ბრავო", image: "story6"))
        stories.append(StoryModel(fullname: "გენავეთ", image: "story7"))
        return stories
    }
    
    func getPages() -> [Page] {
        var pages = [Page]()
        let page1 = Page(imageString: "image1", title: "გურამა", description: "")
        let page2 = Page(imageString: "image2", title: "თაქთაქა", description: "")
        let page3 = Page(imageString: "image3", title: "ქაფქაფა", description: "")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        return pages
    }
    
    
    
    
}
