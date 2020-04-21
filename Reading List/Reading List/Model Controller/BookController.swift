//
//  BookController.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {

    
    init() {
        loadFromPersistentStore()
    }
    
      var books: [Book] = [Book(title: "Dune", reasonToRead: "its cool"), Book(title: "LoTR: Fellowship of The Rings", reasonToRead: "Why not")]
    
    @discardableResult func createBook(title: String, reasonToRead: String, hasBeenRead: Bool) -> Book {
      
        let book  = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        
        books.append(book)
        saveToPersistentStore()
        
        return book
    }
    
    
    func deleteBook(bookToDelete: Book) {
       
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(for book: Book) {
    
        if book.hasBeenRead {
            book.hasBeenRead = false
        }
        else {
            book.hasBeenRead = true
        }
        saveToPersistentStore()
    }
    
    func updateTitleAndReason() {
     
        saveToPersistentStore()
    }
    
    var readBooks: [Book] {
        return books.filter {$0.hasBeenRead}
    }
    
    var unreadBooks: [Book] {
        return books.filter {$0.hasBeenRead == false}
    }
    
    

    var readingListURL: URL? {
        
        let fileManager = FileManager.default
        
        // Go to the documents directory of our app
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let booksURL = documentsDir.appendingPathComponent("readinglist.plist")
        
        return booksURL
    }
    
   
    func saveToPersistentStore() {
        
        do {
            
             guard let readingListURL = readingListURL else {return}
            
            let encoder = PropertyListEncoder()
            
            let booksData = try encoder.encode(books)
            
            try booksData.write(to: readingListURL)
            
            
        } catch {
            print("Error saving books: \(error)")
        }
        
    }

    func loadFromPersistentStore() {
        
        guard let readingListURL = readingListURL else {return}
        
        do {
            let booksData = try Data(contentsOf: readingListURL)
            
            let decoder = PropertyListDecoder()
            
            let booksArray = try decoder.decode([Book].self, from: booksData)
            
            self.books = booksArray
            
        } catch {
            print("Error loading books from plist: \(error)")
        }
    }
}
