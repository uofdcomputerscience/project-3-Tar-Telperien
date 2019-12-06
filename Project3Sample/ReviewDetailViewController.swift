//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var reviewText: UITextView!
    
    @IBOutlet weak var reviewerName: UILabel!
    
    var reviewer: String?
    var review: String?
    var coverImage: UIImage?
    var service: ReviewService?
    
    override func viewDidLoad() {
        reviewerName.text = reviewer
        reviewText.text = review
        bookCover.image = coverImage
        
    }
}
