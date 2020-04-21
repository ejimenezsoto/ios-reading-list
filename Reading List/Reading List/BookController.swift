//
//  BookController.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book] = []
    



var readingListURL: URL? {
    
    let fileManager = FileManager.default
    
    let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    
    let bookURL = documentsDir?.appendingPathComponent("ReadingList.plist")
       
       return bookURL
    
    }

func saveToPersistentStore() {
    
            do {
                
                let encoder = PropertyListEncoder()
                
                // Convert the [Star] into plist
                let booksData = try encoder.encode(books)
                
                // Make sure the location we are saving the stars to exists
                guard let readingListURL = readingListURL else { return }
                
                // Save the plist to the location we chose
                try booksData.write(to: readingListURL)
                
            } catch {
                // Handle the error that gets "thrown" here
                print("Error saving books: \(error)")
                
            }
        }
    }

