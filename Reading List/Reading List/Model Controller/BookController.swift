//
//  BookController.swift
//  Reading List
//
//  Created by Enzo Jimenez-Soto on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book]

    var readBooks: [Book] {
        return books.filter { $0.hasBeenRead }
    }
    
    var unreadBooks: [Book] {
        return books.filter { !$0.hasBeenRead }
    }
    
    var readingListURL: URL? {
        
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let booksURL = documentsDir?.appendingPathComponent("ReadingList.plist")
        
        return booksURL
    }
    
    init() {
        books = []
        loadFromPersistentStore()
    }

    func createBook(title: String, reasonToRead: String) {
        var book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
    
    func deleteBook(book: Book) {
        if let bookIndex = books.firstIndex(of: book) {
            books.remove(at: bookIndex)
        }
        saveToPersistentStore()
    }

    func updateHasBeenRead(for book: Book) {
        if let bookIndex = books.firstIndex(of: book) {
            books[bookIndex].hasBeenRead = !books[bookIndex].hasBeenRead
        }
        saveToPersistentStore()
    }
    
    func editBook(book: Book, newTitle: String, newReasonToRead: String) {
        if let bookIndex = books.firstIndex(of: book) {
            books[bookIndex].reasonToRead = newReasonToRead
            books[bookIndex].title = newTitle
        }
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            guard let readingListURL = readingListURL else { return }
            try booksData.write(to: readingListURL)
            
            print("saved")
        } catch {
            print("Couldn't save list: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let readingListURL = readingListURL else { return }
            
            let booksPlist = try Data(contentsOf: readingListURL)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: booksPlist)
            self.books = decodedBooks
            
            print("recovered")
        } catch {
            print("Couldn't load books: \(error)")
        }
    }
}
