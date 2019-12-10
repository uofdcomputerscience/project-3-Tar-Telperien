//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
    @IBOutlet weak var bookListView: UITableView!
    
    @IBOutlet weak var refreshBooks: UIButton!
    
    var books: [Book] = []
    let service = BookService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBooks {
            self.books = self.service.books
            DispatchQueue.main.async {
                self.bookListView.reloadData()
            }
        }
        bookListView.dataSource = self
        bookListView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // the button that was tapped
        guard let button = sender as? UIButton else { return }
        // the button is in a view inside the cell, so superview.superview is the cell
        guard let cell = button.superview?.superview as? UITableViewCell else { return }
        // get the index from the tableview for that cell.
        guard let indexPath = bookListView.indexPath(for: cell) else { return }
        // that gives us an index into the book array.
        let book = service.books[indexPath.row]
        // get the destination view controller as a review list vc
        guard let destination = segue.destination as? ReviewsOfOneBookViewController else { return }
        // set a variable on that review list vc.
        destination.book = book
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.service.fetchBooks {
                self.books = self.service.books
            }
            self.bookListView.reloadData()
        }
    }
}


extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.item]
        let bookDetail = storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        bookDetail.titleText = selectedBook.title
        bookDetail.authorText = selectedBook.author
        bookDetail.publishedText = selectedBook.published
        bookDetail.id = selectedBook.id
        service.image(for: selectedBook) { (book, image) in
            DispatchQueue.main.async {
                bookDetail.coverImage = image
            }
        }
        present(bookDetail, animated: true)
    }
}


extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.configure(book: books[indexPath.item], service: service)
        return cell
    }
}
