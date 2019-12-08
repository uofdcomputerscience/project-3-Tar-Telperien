//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    @IBOutlet weak var reviewListView: UITableView!
    
    @IBOutlet weak var refreshReviews: UIButton!
    
    var reviews: [Review] = []
    let service = ReviewService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchReviews {
            self.reviews = self.service.reviews
            DispatchQueue.main.async {
                self.reviewListView.reloadData()
            }
        }
        reviewListView.dataSource = self
        reviewListView.delegate = self
    }
    @IBAction func refreshTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.service.fetchReviews {
                self.reviews = self.service.reviews
            }
            self.reviewListView.reloadData()
        }
    }
}

extension ReviewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedReview = reviews[indexPath.item]
        let reviewDetail = storyboard?.instantiateViewController(withIdentifier: "ReviewDetailViewController") as! ReviewDetailViewController
        reviewDetail.review = selectedReview.body
        reviewDetail.reviewer = selectedReview.reviewer
        reviewDetail.titleText = selectedReview.title
    }
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell //build a review cell
        cell.configure(reviews[indexPath.item], rService: service)
        return cell
    }
    
    
}
