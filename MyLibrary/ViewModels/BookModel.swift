//
//  BookModel.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/3/21.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        self.books = DataService.getLocalData()
        
    }
    
    func updateRating(bookIndex: Int, newRating:Int) {
        if let index = books.firstIndex(where: { $0.id == bookIndex}) {
            books[index].rating = newRating
        }
    }
    
    func updateFavorite(bookIndex: Int) {
        if let index = books.firstIndex(where: {$0.id == bookIndex}) {
            books[index].isFavourite.toggle()
        }
    }
    
    func updatePage(bookIndex: Int, page: Int) {
        if let index = books.firstIndex(where: {$0.id == bookIndex}) {
            books[index].currentPage = page
        }
    }
    
}
