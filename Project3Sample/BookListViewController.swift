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
    
    var books: [Book] = []
    let service = BookService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBooks {
            self.service.books = self.books
        }
        DispatchQueue.main.async {
            self.bookListView.reloadData()
        }
        bookListView.dataSource = self
        bookListView.delegate = self
    }
    
}


extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.item]
        let bookDetail = storyboard?.instantiateViewController(identifier: "BookDetailViewController") as! BookDetailViewController
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = items[indexPath.item]
        let detail = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//        detail.titleLabel.text = selectedObject.name
//        service.getImage(for: selectedObject.imageURL) { (url, image) in
//            DispatchQueue.main.async {
//                detail.largeImage.image = image
//            }
//        }
        detail.initialTitle = selectedObject.name
        detail.initialURL = selectedObject.imageURL
        detail.service = service
        navigationController?.pushViewController(detail, animated: true)
    }
}


extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        return cell
    }
    
    
}
