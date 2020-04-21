//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var readButtonLabel: UIButton!
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    var delegate: BookTableViewDelegate?
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        titleLabel.text = book?.title
    }
    

}


