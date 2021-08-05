//
//  BookDetail.swift
//  MyLibrary
//
//  Created by Kevin Tooley on 8/5/21.
//

import SwiftUI

struct BookDetail: View {
    
    @EnvironmentObject var model:BookModel
    var book: Book
    @State var starType = ""
    @State var rating = 1
    
//    init() {
//        starType =  book.isFavourite ? "star.fill" : "star"
//    }
    
    var body: some View {
        VStack {
            Spacer()
            
            NavigationLink(
                destination: BookContent(book: book),
                label: {
                    VStack {
                        Text("Read Now!")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                        Image("cover\(book.id)")
                            .resizable()
                            .scaledToFit()
                    }
                })

            Button(action: {
                model.updateFavorite(bookIndex: book.id)
                starType = book.isFavourite ? "star.fill" : "star"
            }, label: {
                VStack {
                    Text("Mark for Later")
                        .font(.headline)
                        .foregroundColor(Color.black)
                    Image(systemName: starType)
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 30, height: 30)
                }
            }).padding()
            .onAppear(perform: {
                starType = book.isFavourite ? "star.fill" : "star"
            })
            
            Text("Rate \(book.title)")
            Picker("", selection: $rating) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: rating, perform: { value in
                model.updateRating(bookIndex: book.id, newRating: rating)
                })
            

            Spacer()
            
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle(book.title)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: Book())
            .environmentObject(BookModel())
    }
}
