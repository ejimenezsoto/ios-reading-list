//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    var bookController: BookController?
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let book = book {
            bookTitleTextField.text = book.title
            reasonToReadTextView.text = book.reasonToRead
            self.title = book.title
        } else {
            self.title = "Add a new book"
        }
    }
    
    
     // MARK: - Navigation
 
    @IBAction func saveBook(_ sender: Any) {
        if let book = book,
            let title = bookTitleTextField.text {
            bookController?.editBook(book: book, newTitle: title, newReasonToRead: reasonToReadTextView.text)
        } else if let title = bookTitleTextField.text {
            bookController?.createBook(title: title, reasonToRead: reasonToReadTextView.text)
        }
        navigationController?.popViewController(animated: true)
    }
}
