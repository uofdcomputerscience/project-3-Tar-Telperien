//
//  ReviewCell.swift
//  Project3Sample
//
//  Created by Amelia on 05/12/2019.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var reviewBookTitle: UILabel!
    @IBOutlet weak var reviewerName: UILabel!
    
    func configure(_ review: Review, rService: ReviewService) {
        reviewBookTitle.text = review.title
        reviewerName.text = review.reviewer
    }
}
