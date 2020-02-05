//
//  ArticalsModel.swift
//  News Api using MVVM
//
//  Created by sarath kumar on 04/02/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import Foundation
import UIKit

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    var title: String
    var description: String
}
