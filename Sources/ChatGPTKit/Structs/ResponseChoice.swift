//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct ResponseChoice: Codable {
    var index: Int
    var message: Message
    var finish_reason: String
}

