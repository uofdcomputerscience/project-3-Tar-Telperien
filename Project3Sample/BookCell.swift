//
//  BookCell.swift
//  Project3Sample
//
//  Created by Amelia on 03/12/2019.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    
    func configure(book: Book, service: BookService) {
        bookTitle.text = book.title
        service.image(for: book) { (book, image) in
            self.bookCover.image = image
        }
    }
}
