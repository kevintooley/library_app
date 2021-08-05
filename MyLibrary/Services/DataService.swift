//
//  DataService.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/3/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        
        // get url path
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // guard pathString
        guard pathString != nil else {
            return [Book]()
        }
        
        // create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create data object
            let data = try Data(contentsOf: url)
            
            // create decoder
            let decoder = JSONDecoder()
            
            do {
                // decode data with Json decoder
                let bookData = try decoder.decode([Book].self, from: data)
                
//                // add unique id's
//                for b in bookData {
//                    b.uuid = UUID()
//                }
                
                // return the book array
                return bookData
                
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Book]()
        
    }
    
}
