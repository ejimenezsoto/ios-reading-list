//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var hasBeenReadButton: UIButton!
    
    var delegate: BookTableViewCellDelegate?
    var book: Book? {
        didSet {
            updateViews()
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
//        updateViews()
    }
    
    func updateViews() {
        if let book = book {
            bookTitleLabel.text = book.title
            print(book.title, book.hasBeenRead)
            if book.hasBeenRead {
                hasBeenReadButton.setImage(UIImage(named: "checked"), for: .normal)
            } else {
                hasBeenReadButton.setImage(UIImage(named: "unchecked"), for: .normal)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func hasBeenReadButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }

}



