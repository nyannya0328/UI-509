//
//  Message.swift
//  UI-509
//
//  Created by nyannyan0328 on 2022/03/16.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id = UUID().uuidString
    var messageString : String
    var date : Date = Date()
    var preViewLoading : Bool = false
    var linkMetaData : LPLinkMetadata?
    var linkURL : URL?
    
}
