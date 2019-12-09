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
    
    var reviews: [Review] = []
    let service = ReviewService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchReviews {
            self.reviews = self.service.reviews.filter { (review) -> Bool in
                    review.bookId == 12 //MAGIC NUMBER THAT SHOULD NOT BE 12!!!! FIND WAY TO GET BOOK ID FROM CLICKED CELL!!!!
                }
        }
        DispatchQueue.main.async {
            self.reviewListView.reloadData()
        }
        reviewListView.dataSource = self
        reviewListView.delegate = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        return cell
    }
}
