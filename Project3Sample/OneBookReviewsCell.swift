//
//  OneBookReviewsCell.swift
//  Project3Sample
//
//  Created by Amelia on 10/12/2019.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class OneBookReviewsCell: UITableViewCell {
    
    @IBOutlet weak var reviewAuthorLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    
    var book: Book?
    
    func configure(_ review: Review, rService: ReviewService) {
        reviewAuthorLabel.text = review.reviewer
        bookTitleLabel.text = book?.title
    }
}
