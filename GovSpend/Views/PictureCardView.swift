//
//  PictureCardView.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import SwiftUI

struct PictureCardView: View {
    var body: some View {
        
        
        HStack (spacing: 8){
            
           

            VStack(spacing: 7) {
                HStack (spacing: 7) {
                    VStack (spacing: 7){
                        
                        HStack {
                            
                            Text("Bernard Sanders")
                                .font(.system(size: 14).bold())
                        }
                        .frame(width: 300, height: 10, alignment: .center)
                        //.background(Color(K.appColors.green))
                        
                        HStack {
                            
                            Text("Party:")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .trailing)
                            Text("details.party")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .leading)
                        }
                        .frame(width: 300, height: 10, alignment: .center)
                        //.background(Color(K.appColors.green))
                        
                        HStack {
                            
                            Text("Status:")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .trailing)
                            Text("details.district")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .leading)
                        }
                        .frame(width: 300, height: 10, alignment: .center)
                        //.background(Color(K.appColors.green))
                        
                        HStack {
                            
                            Text("State:")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .trailing)
                            Text("state")
                                .font(.system(size: 12))
                                .frame(width: 100, height: 20, alignment: .leading)
                        }
                        .frame(width: 300, height: 10, alignment: .center)
                        //.background(Color(K.appColors.green))
                        
                    }
                    
                }
           
                .frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .center)
                .background(Color(K.appColors.background))
                .shadow(radius: 1)
                .cornerRadius(8)
                
                
                HStack (spacing: 30){
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image("phone").resizable().frame(width: 20, height: 20, alignment: .center)
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image("contact").resizable().frame(width: 20, height: 20, alignment: .center)
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image("twitter").resizable().frame(width: 20, height: 20, alignment: .center)
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image("youtube").resizable().frame(width: 20, height: 20, alignment: .center)
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image("website").resizable().frame(width: 20, height: 20, alignment: .center)
                    })
                }
                .frame(width: UIScreen.main.bounds.width-50, height: 30, alignment: .center)
                .background(Color(K.appColors.blue))
                .cornerRadius(8)
                

            }
            //.frame(width: 400, height: 145, alignment: .center)
            .frame(width: UIScreen.main.bounds.width-25, height: 145, alignment: .center)
            .background(Color(K.appColors.gray))
            .shadow(radius: 5)
            .cornerRadius(8)
            
      

        }
        .frame(width: 420, height: 160, alignment: .center)
        //.background(Color(K.appColors.lightGray))
        
        
        
        
        
        
        
        
        
        HStack (spacing: 8){
            
            
            VStack {
                let theImage = "https://i.imgur.com/L4tLYAz.jpeg"
                RemoteImage(url: theImage)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 140, alignment: .center)
                    .clipShape(Rectangle())
                    .shadow(radius: 5)
                    .cornerRadius(8)
            }
            
            
            
            VStack(spacing: 7) {
                
                HStack (spacing: 7) {
                    
                    VStack {
                        HStack {
                            Text("Bernard Sanders")
                                .font(.system(size: 14)).fontWeight(.semibold)
                        }
                        .frame(width: 280, height: 20, alignment: .center)
                        .background(Color(K.appColors.green))
                        
                        HStack {
                            VStack {
                                Text("Elected:")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .trailing)
                            //.background(Color(.white))
                            VStack {
                                Text("2006")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .leading)
                            //.background(Color(.white))
                        }
                        .frame(width: 280, height: 20, alignment: .center)
                        .background(Color(K.appColors.green))
                        
                        
                        
                        HStack {
                            VStack {
                                Text("Office:")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .trailing)
                           // .background(Color(.white))
                            VStack {
                                Text("Senate")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .leading)
                            //.background(Color(.white))
                        }
                        .frame(width: 280, height: 20, alignment: .center)
                        .background(Color(K.appColors.green))
                        
                        
                        
                        HStack {
                            VStack {
                                Text("Party:")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .trailing)
                            //.background(Color(.white))
                            VStack {
                                Text("Democrat")
                                    .font(.system(size: 11))
                            }
                            .frame(width: 100, height: 20, alignment: .leading)
                            //.background(Color(.white))
                        }
                        .frame(width: 280, height: 20, alignment: .center)
                        .background(Color(K.appColors.green))
                    }
                    
                    
                    
                    
                }
                //.padding(.leading)
                .frame(width: 280, height: 90, alignment: .leading)
                .background(Color(K.appColors.lightGray))
                .shadow(radius: 1)
                .cornerRadius(8)
                
                
                HStack {
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image(systemName: "phone")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image(systemName: "note")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image(systemName: "phone")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image(systemName: "phone")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Image(systemName: "phone")
                    })
                }
                .frame(width: 280, height: 30, alignment: .center)
                .background(Color(K.appColors.blue))
                .cornerRadius(8)
                

            }
            .frame(width: 300, height: 145, alignment: .center)
            .background(Color(K.appColors.gray))
            .shadow(radius: 5)
            .cornerRadius(8)
            
            
            
            
            
            
        }
        .frame(width: 420, height: 160, alignment: .center)
        //.background(Color(K.appColors.lightGray))
        
        
        
    }
}


struct PictureCardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: PictureCardView().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
