//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController {
    
    @IBOutlet weak var reviewerEntry: UITextField!
    
    @IBOutlet weak var titleEntry: UITextField!
    
    @IBOutlet weak var reviewBody: UITextView!
    
    @IBOutlet weak var addReviewButton: UIButton!
    
    var reviewerText: String?
    var titleText: String?
    var reviewText: String?
    var newReview: Review?
    var service: ReviewService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewerEntry.delegate = self
        titleEntry.delegate = self
        reviewBody.delegate = self
        service = ReviewService()
    }
    
    func enableAddReview() {
        if reviewerText != nil && titleText != nil && reviewText != nil {
            addReviewButton.isEnabled = true
        }
    }
    
    @IBAction func addReviewPressed(_ sender: UIButton){
        var newReview: Review = Review(bookId: <#T##Int#>, date: Calendar.autoupdatingCurrent, reviewer: reviewerText, title: titleText, body: reviewText)
        service?.createReview(review: newReview, completion: nil)
    }
}

extension ReviewInputViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == reviewerEntry {
            reviewerText = reviewerEntry.text
        }
        if textField == titleEntry {
            titleText = titleEntry.text
        }
        return true
    }
}

extension ReviewInputViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        reviewText = reviewBody.text
    }
}
