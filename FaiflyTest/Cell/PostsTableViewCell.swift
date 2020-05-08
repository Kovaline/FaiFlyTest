//
//  PostsTableViewCell.swift
//  FaiflyTest
//
//  Created by Ihor Kovalenko on 08.05.2020.
//  Copyright © 2020 Ihor Kovalenko. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleText: UITextView!
    @IBOutlet weak var ArticleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
