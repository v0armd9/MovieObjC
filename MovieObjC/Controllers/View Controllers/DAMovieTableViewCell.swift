//
//  DAMovieTableViewCell.swift
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class DAMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!

    func updateCell(movie: DAMovie) {
        titleLabel.text = movie.title
        ratingLabel.text = ("Rating \(movie.rating)")
        overviewTextView.text = movie.overview
    }

}
