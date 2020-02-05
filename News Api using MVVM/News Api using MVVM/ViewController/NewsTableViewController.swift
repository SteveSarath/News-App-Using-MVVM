//
//  NewsTableViewController.swift
//  News Api using MVVM
//
//  Created by sarath kumar on 04/02/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//
import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=be3f305947db4380b53d2fdbae9b6606")!
        
        WebService().getArticalNews(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.articleListVM == nil ? 0 : self.articleListVM!.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.articleListVM?.numberOfRowsInSection(section))!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell else {
            fatalError("tableview not found")
        }
        let articleVM = self.articleListVM!.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }


}
