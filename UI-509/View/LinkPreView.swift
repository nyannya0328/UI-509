//
//  LinkPreView.swift
//  UI-509
//
//  Created by nyannyan0328 on 2022/03/16.
//

import SwiftUI
import LinkPresentation

struct LinkPreView: UIViewRepresentable {
    
    var metaData : LPLinkMetadata
    func makeUIView(context: Context) -> LPLinkView{
        
        let preView = LPLinkView(metadata: metaData)
        
        return preView
        
        
    }
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
        
        uiView.metadata = metaData
        
    }
}


