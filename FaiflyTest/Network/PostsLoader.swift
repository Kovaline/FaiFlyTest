//
//  PostsLoader.swift
//  FaiflyTest
//
//  Created by Ihor Kovalenko on 07.05.2020.
//  Copyright © 2020 Ihor Kovalenko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostsLoader {
    
    let key = "api-key=gCXiLAQOjySHn4fjut8Uc35470NaWBp3"
    let baseUrl = "https://api.nytimes.com/svc/search/v2/articlesearch.json?fq=news_desk:("
    let sortUrl = ")&sort=newest&"
    
    func loadPosts(section: String, completion:@escaping ([PostsInfo])->()) {
        let url = baseUrl + section + sortUrl + key
        
        AF.request(url, method: .get, parameters: nil).responseJSON { response in
            switch(response.result){
            case .success(let value):
                let json = JSON(value)
                var articles = [PostsInfo]()
                for(_, subJSON) in json["response"]["docs"] {
                    let title = subJSON["headline"]["main"]
                    let first_p = subJSON["lead_paragraph"]
                    let imageURL = subJSON["multimedia"][0]["url"]
                    let webULR = subJSON["web_url"]
                    articles.append(PostsInfo(title: title.string, lead_paragraph: first_p.string, imageURL: imageURL.string, webURL: webULR.string))
                }
                completion(articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
