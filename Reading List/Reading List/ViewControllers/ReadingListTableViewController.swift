//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {
    
    var bookController = BookController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // change to 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReadingListTableViewCell", for: indexPath) as? BookTableViewCell else {fatalError("32")}
        
        let book = bookController.books[indexPath.row]
        cell.book = book

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
 

}
