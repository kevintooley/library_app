//
//  Book.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/3/21.
//

import Foundation

class Book: Identifiable, Decodable {
    
    var id:Int = 1
    var title:String = "Test Book"
    var author:String = "Test Author"
    var isFavourite:Bool = false
    var currentPage:Int = 0
    var rating:Int = 2
    var content:[String] = ["Page 1", "Page 2", "Page 3"]
    
    func updatePage(pageTag:Int) {
        currentPage = pageTag
    }
    
    func updateFavorite() {
        isFavourite = isFavourite ? false : true
    }
    
    
    
}
