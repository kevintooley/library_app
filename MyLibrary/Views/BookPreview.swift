//
//  TestView.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/4/21.
//

import SwiftUI

struct BookPreview: View {
    
    //@ObservedObject var model = BookModel()
    @EnvironmentObject var model:BookModel
    var book:Book
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            VStack (alignment: .leading) {
                HStack {
                    
                    Text(book.title)
                        .font(.largeTitle)
                        .padding(.leading)
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            .padding(.trailing)
                    }
                }
                Text(book.author)
                    .italic()
                    .padding(.leading)
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                
            }.padding()
        }.accentColor(.black)
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: Book())
    }
}
