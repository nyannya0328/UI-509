//
//  Home.swift
//  UI-509
//
//  Created by nyannyan0328 on 2022/03/16.
//

import SwiftUI

struct Home: View {
    @StateObject var model = LinkViewModel()
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing:20){
                    
                    
                    ForEach(model.messages){msg in
                        
                        cardView(msg: msg)
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Link Presetation")
            .safeAreaInset(edge: .bottom) {
                
                HStack(spacing:10){
                    
                    
                    TextField("Enter Message", text: $model.message)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    Button {
                        
                        model.sendMessage()
                        
                    } label: {
                        
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                    }

                }
                .padding(.vertical)
                .padding(.horizontal,20)
                .background(.ultraThinMaterial)
            }
            
        }
       
    }
    @ViewBuilder
    func cardView(msg : Message)->some View{
        
        
        Group{
            
            if msg.preViewLoading{
                
                
                Group{
                    
                    
                    if let metaData = msg.linkMetaData{
                        
                        
                        LinkPreView(metaData: metaData)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getScreenBounds().width - 80)
                            .cornerRadius(15)
                            .frame(maxWidth:.infinity,alignment: .trailing)
                    }
                    
                    else{
                        
                        HStack{
                            
                            
                            Text(msg.linkURL?.host ?? "")
                                
                            
                            ProgressView()
                                .tint(.red)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.23))
                        .cornerRadius(10)
                        .frame(maxWidth:.infinity,alignment: .trailing)
                    
                    }
                    
                    
                }
                
            }
            
            else{
                
                
                Text(msg.messageString)
                    .padding(.vertical,20)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(20)
                    .frame(width: getScreenBounds().width - 80, alignment: .trailing)
                
            }
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
}
