//
//  ArticleViewController.swift
//  FaiflyTest
//
//  Created by Ihor Kovalenko on 07.05.2020.
//  Copyright © 2020 Ihor Kovalenko. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    var articleURL = ""
    
    @IBOutlet weak var articleWeb: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleWeb.load(NSURLRequest(url: NSURL(string: articleURL)! as URL) as URLRequest)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
