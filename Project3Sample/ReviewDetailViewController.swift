//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    @IBOutlet weak var reviewText: UITextView!
    
    @IBOutlet weak var reviewerName: UILabel!
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
    var reviewer: String?
    var review: String?
    var titleText: String?
    var bookTitleText: String?
    var service: ReviewService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewerName.text = reviewer
        reviewTitle.text = titleText
        reviewText.text = review
    }
}
