//
//  ContentView.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/3/21.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model: BookModel
    //@ObservedObject var model = BookModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack (spacing: 30) {
                    ForEach (model.books) { book in
                        NavigationLink(
                            destination: BookDetail(book: book)) {
                                BookPreview(book: book)
                                    .padding([.leading, .trailing], 20)
                            }
                    }
                }
            }.navigationTitle("My Library")
            
        }
            
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(BookModel())
    }
}
