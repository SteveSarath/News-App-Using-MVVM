//
//  WebService.swift
//  News Api using MVVM
//
//  Created by sarath kumar on 04/02/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import UIKit

class WebService: NSObject {
    
    func getArticalNews(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
            
        }.resume()
        
    }

}
