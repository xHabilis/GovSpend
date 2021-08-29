//
//  Reusable.swift
//  GovSpend
//
//  Created by Isaac M on 7/29/21.
//

import Foundation
import SwiftUI

//MARK: - Single Item

struct SingleItem: View {

    let titleText: String
    let labelText: String
    let color: String

    var body: some View {
        HStack (alignment: .center, spacing: 0){
            Text(titleText)
                .font(.system(size: 10))
                .frame(width: 85, height: 28, alignment: .leading)

            Text(labelText)
                .font(.system(size: 10))
                .foregroundColor(.black)
                .frame(width: 80, height: 20, alignment: .center)
                .background(Color(color))
                .cornerRadius(8)

        }
        .frame(width: 165, height: 30, alignment: .center)
    }
}

//MARK: - Categories

struct CategoryLink: View {
    
    var CategoryUrlName: String
    var CategoryTitle: String
    
    var body: some View {
        NavigationLink(
            destination: CategoryResultView(categoriesList: CategorySearchManager(), candidateDetailsManager: CandidateDetailsManager(), categoryUrl: CategoryUrlName, title: CategoryTitle),
            label: {
                
                Text(CategoryTitle)
                
            })
            .foregroundColor(Color(.black))
            .font(.system(size: 12))
            .frame(width: 115, height: 32, alignment: .center)
            .background(Color(K.appColors.green))
            .cornerRadius(10)
            .shadow(color: Color(K.appColors.cardShadow),radius: 2)

            
    }
}

//MARK: - ItemValue Pair

struct ItemNameValue: View {
    
    let itemName: String
    let itemValue: String
    let itemValueColor: String
    
    var body: some View {
        HStack(spacing: 20){
            Text(itemName)
                .font(.system(size: 12))
                .padding(.leading)
                .frame(width: 190, height: 30, alignment: .trailing)

            Text(String(itemValue))
                .foregroundColor(Color.black)
                .font(.system(size: 12)).fontWeight(.semibold)
                .frame(width: 140, height: 30, alignment: .center)
                .background(Color(itemValueColor))
                .cornerRadius(8)
                .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
        }
        .frame(width: UIScreen.main.bounds.width-25, height: 30, alignment: .leading)
        
    }
}

//MARK: - Get Images

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "exclamationmark.square")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}

//MARK: - Person Details

struct CongressListCard: View {
    
    var firstName: String
    var lastName: String
    var party: String
    var statusTitle: String
    var status: String
    var stateTitle: String
    var state: String
    
    var body: some View {
        VStack(spacing: -2.0){
            
            HStack{
                Text("\(firstName) \(lastName)")
                    .padding(.leading, 20.0)
                    .frame(width: 246, height: 20, alignment: .center)
                    //.background(Color(.green))
                    .font(.system(size: 12).bold())
                
                Text("\(party)")
                    .font(.system(size: 12)).bold()
                    .padding(.trailing, 4)
                    .shadow(radius: 2)
                    .frame(width: 25, height: 20, alignment: .topTrailing)
                //.background(Color(.green))
                
            }
            
            HStack {
                Text("\(statusTitle)")
                    .font(.system(size: 10))
                    .frame(width: 100, height: 15, alignment: .trailing)
                
                
                Text(Configs.makeStatus(status: String(status)))
                    .font(.system(size: 10).weight(.semibold))
                    .frame(width: 100, height: 15, alignment: .leading)
                
            }
            HStack {
                Text("\(stateTitle)")
                    .font(.system(size: 10))
                    .frame(width: 100, height: 15, alignment: .trailing)
                
                
                Text("\(state)")
                    .font(.system(size: 10).weight(.semibold))
                    .frame(width: 100, height: 20, alignment: .leading)
                
            }
            
        }
    }
}

//MARK: - CongressBookMark

struct CongressBookMark: View {
    
    var firstName: String
    var lastName: String
    var party: String
    var stateTitle: String
    var state: String
    
    var body: some View {
        VStack(spacing: -2.0){
            
            HStack{
                Text("\(firstName) \(lastName)")
                    .padding(.leading, 20.0)
                    .frame(width: 246, height: 20, alignment: .center)
                    .font(.system(size: 12).bold())
                
                Text("\(party)")
                    .font(.system(size: 12)).bold()
                    .padding(.trailing, 4)
                    .shadow(radius: 2)
                    .frame(width: 25, height: 20, alignment: .topTrailing)
                
            }

            HStack {
                Text("\(stateTitle)")
                    .font(.system(size: 10))
                    .frame(width: 100, height: 15, alignment: .trailing)
                
                
                Text("\(state)")
                    .font(.system(size: 10).weight(.semibold))
                    .frame(width: 100, height: 20, alignment: .leading)
                
            }
            
        }
    }
}





//MARK: - SearchBar

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search Names", text: $text)
                .font(.system(size: 12))
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
