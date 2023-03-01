//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct Response: Codable {
    var id: String
    var object: String
    var created: Int
    var choices: [ResponseChoice]
    var usage: APIUsage
}
