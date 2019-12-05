//
//  ReviewCell.swift
//  Project3Sample
//
//  Created by Amelia on 05/12/2019.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var reviewBookCover: UIImageView!
    @IBOutlet weak var reviewBookTitle: UILabel!
    //add a review sample?=
    
    
    
    func configure(_ book: Book) {
        reviewBookCover.image = book.name
        reviewBookTitle.text = book.title
    }
}
