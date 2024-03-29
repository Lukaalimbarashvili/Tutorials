//
//  DownloadImage.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import UIKit


extension String {
  func downloadImage(completion: @escaping (UIImage?) -> ()) {
    guard let url = URL(string: self) else {return}
    URLSession.shared.dataTask(with: url) { (data, res, err) in
      guard let data = data else {return}
      completion(UIImage(data: data))
    }.resume()
  }
}
