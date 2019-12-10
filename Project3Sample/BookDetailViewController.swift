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
    
    @IBOutlet weak var reviewBook: UIButton!
    
    var titleText: String?
    var authorText: String?
    var publishedText: String?
    var coverImage: UIImage?
    var service: BookService?
    var id: Int?
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.text = titleText
        authorLabel.text = authorText
        publishedLabel.text = publishedText
        bookCover.image = coverImage
    }

    
    @IBAction func reviewBookPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ReviewInputViewController") as! ReviewInputViewController
        vc.bookID = id
        present(vc, animated: true)
    }
}
