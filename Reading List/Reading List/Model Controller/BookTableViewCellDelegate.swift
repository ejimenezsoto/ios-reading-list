//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewDelegate {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
    
}

