//
//  LinkViewModel.swift
//  UI-509
//
//  Created by nyannyan0328 on 2022/03/16.
//

import SwiftUI
import LinkPresentation

class LinkViewModel: ObservableObject {
    @Published var message : String = ""
    
    @Published var messages : [Message] = []
    
    
    
    func sendMessage(){
        
        if !isMessageURL(){
            
            
            addToMessage()
            
            return
        }
        
        guard let url = URL(string: message)else{return}
        
        
        let urlMessage = Message(messageString: message,preViewLoading: true,linkURL: url)
        
        messages.append(urlMessage)
        
        
        let proVider = LPMetadataProvider()
        proVider.startFetchingMetadata(for: url) { meta, err in
            
            
            DispatchQueue.main.async {
                
                self.message = ""
                
                
                if let _  = err{
                    
                    self.addToMessage()
                    return
                    
                    
                }
                
                guard let meta = meta else{
                    
                    
                    self.addToMessage()
                    
                    return
                    
                }
                
                if let index = self.messages.firstIndex(where: { message in
                    
                    
                    return urlMessage.id == message.id
                }){
                    
                    
                    self.messages[index].linkMetaData = meta
                    
                }
                
                
                
                
                
            }
        }
        
        
        
    }
    
    func isMessageURL()->Bool{
        
        
        if let url = URL(string: message){
            
            return UIApplication.shared.canOpenURL(url)
            
        }
        
        return false
    }
    
    
    func addToMessage(){
        
        messages.append(Message(messageString: message))
        message = ""
        
        
    }
}

