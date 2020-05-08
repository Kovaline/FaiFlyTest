//
//  PostsViewController.swift
//  FaiflyTest
//
//  Created by Ihor Kovalenko on 07.05.2020.
//  Copyright © 2020 Ihor Kovalenko. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var section = ""
    var articles = [PostsInfo]()
    let network = PostsLoader()
    @IBOutlet weak var postsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        postsTable.isHidden = true
        network.loadPosts(section: section) {articles in
            self.articles = articles
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            self.postsTable.isHidden = false
            self.postsTable.reloadData()
        }

    }

}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsTableViewCell
        
        cell.articleTitle.text = articles[indexPath.row].title
        cell.articleText.text = articles[indexPath.row].lead_paragraph
        
        if let imageURL = articles[indexPath.row].imageURL {
            let url = URL(string: "https://www.nytimes.com/" + imageURL)
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                cell.ArticleImage.image = UIImage(data: imageData)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleViewController {
            vc.articleURL = articles[indexPath.row].webURL!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
