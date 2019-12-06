//
//  BookDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var publishedLabel: UILabel!
    
    var titleText: String?
    var authorText: String?
    var publishedText: String?
    var coverImage: UIImage?
    var service: BookService?
    
    override func viewDidLoad(){
        titleLabel.text = titleText
        authorLabel.text = authorText
        publishedLabel.text = publishedText
        bookCover.image = coverImage
    }
}
