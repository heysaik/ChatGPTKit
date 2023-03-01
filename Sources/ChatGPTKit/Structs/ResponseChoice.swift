//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct ResponseChoice: Codable, Hashable {
    public var index: Int
    public var message: Message
    public var finish_reason: String
    
    public init(index: Int, message: Message, finish_reason: String) {
        self.index = index
        self.message = message
        self.finish_reason = finish_reason
    }
}

