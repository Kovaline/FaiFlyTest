//
//  ViewController.swift
//  FaiflyTest
//
//  Created by Ihor Kovalenko on 07.05.2020.
//  Copyright © 2020 Ihor Kovalenko. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {
    @IBOutlet weak var sectionsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension SectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SectionsInfo().sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sectionsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = SectionsInfo().sections[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostsViewController") as? PostsViewController {
            vc.section = SectionsInfo().sections[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
