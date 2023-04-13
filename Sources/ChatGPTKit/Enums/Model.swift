//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

// Enums
public enum Model: String {
    // Base
    case turbo = "gpt-3.5-turbo"
    
    // Note: This doesn't listen to system messages as well
    // according to the API documentation
    // Will be deprecated on June 1, 2023
    @available(*, deprecated, message: "This model is deprecated and will not be supported after June 1, 2023. Please use the 'turbo' model instead.")
    case turbo31 = "gpt-3.5-turbo-0301"
    
    // GPT-4
    case gpt4 = "gpt-4"
    case gpt4_32k = "gpt-4-32k"
    
    // GPT-4 Snapshots
    // Not recommended in production as it
    // Will be deprecated on June 14, 2023
    @available(*, deprecated, message: "This model will be deprecated and not supported after June 14th, 2023. Please use the 'gpt4' or 'gpt4_32k' models instead.")
    case gpt4_0314 = "gpt-4-0314"
    
    @available(*, deprecated, message: "This model will be deprecated and not supported after June 14th, 2023. Please use the 'gpt4' or 'gpt4_32k' models instead.")
    case gpt4_32k_0314 = "gpt-4-32k-0314"
}
