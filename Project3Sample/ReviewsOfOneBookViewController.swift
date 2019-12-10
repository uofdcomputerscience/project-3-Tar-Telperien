//
//  ReviewsOfOneBookViewController.swift
//  Project3Sample
//
//  Created by Amelia on 07/12/2019.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewsOfOneBookViewController: UIViewController {
    
    @IBOutlet weak var reviewListView: UITableView!
    
    @IBOutlet weak var refreshReviewsButton: UIButton!
    
    var reviews: [Review] = []
    let service = ReviewService()
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewListView.dataSource = self
        reviewListView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        service.fetchReviews {
            self.reviews = self.service.reviews.filter { $0.bookId == self.book?.id }
//            self.reviews = self.service.reviews.filter({ (review) -> Bool in
//                { review.bookId == self.book?.id }()
//            })
            DispatchQueue.main.async {
                self.reviewListView.reloadData()
            }
        }
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.service.fetchReviews {
                self.reviews = self.service.reviews.filter({ (review) -> Bool in
                    { review.bookId == self.book?.id }()
                })
            }
            self.reviewListView.reloadData()
        }
    }
}

extension ReviewsOfOneBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedReview = reviews[indexPath.item]
        let reviewDetail = storyboard?.instantiateViewController(withIdentifier: "ReviewDetailViewController") as! ReviewDetailViewController
        reviewDetail.review = selectedReview.body
        reviewDetail.reviewer = selectedReview.reviewer
        reviewDetail.titleText = selectedReview.title
        present(reviewDetail, animated: true)
    }
}

extension ReviewsOfOneBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneBookReviewsCell", for: indexPath) as! OneBookReviewsCell
        cell.configure(self.reviews[indexPath.item], rService: service)
        cell.book = book
        return cell
    }
}
