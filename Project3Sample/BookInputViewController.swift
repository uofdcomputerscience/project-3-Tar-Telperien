//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController {
    
    @IBOutlet weak var titleInput: UITextField!
    
    @IBOutlet weak var authorInput: UITextField!
    
    @IBOutlet weak var dateInput: UITextField!
    
    @IBOutlet weak var coverURLInput: UITextField!
    
    @IBOutlet weak var addBookButton: UIButton!
    
    var titleText: String?
    var authorText: String?
    var dateText: String?
    var urlText: String?
    var newBook: Book?
    var service: BookService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleInput.delegate = self
        authorInput.delegate = self
        dateInput.delegate = self
        coverURLInput.delegate = self
        addBookButton.isEnabled = false
        service = BookService()
    }
    
    func enableAddBook() {
        if titleText != nil && authorText != nil && dateText != nil && urlText != nil {
            addBookButton.isEnabled = true
        }
    }
    
    @IBAction func addBookPressed(_ sender: UIButton) {
        let newBook = Book(id: nil, title: titleText!, author: authorText!, published: dateText!, imageURLString: urlText!)
        service?.createBook(book: newBook, completion:{})
    }
}

extension BookInputViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleInput {
            titleText = titleInput.text
        }
        if textField == authorInput {
            authorText = authorInput.text
        }
        if textField == dateInput {
            dateText = dateInput.text
        }
        if textField == coverURLInput {
            urlText = coverURLInput.text
            performSegue(withIdentifier: "continue", sender: self)
        }
        return true
    }
    
}
