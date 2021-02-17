//
//  APIService.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation

struct userApi:Codable {
    let results : [User]
}

struct User:Codable {
    let urls : url
    let user : tempUser
}

struct url:Codable {
    let raw     :String
    let full    :String
    let regular :String
    let small   :String
}


struct tempUser:Codable {
    let name :String
}


struct APIResponse {
    func getImages(completion: @escaping (userApi)->()){
        guard let url = URL(string: "https://run.mocky.io/v3/7c0103d3-c651-44dc-808c-601dd21763b3") else{return}
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(userApi.self, from: data)
                completion(response)
            }catch{print(error.localizedDescription)}
        }.resume()
    }
}
