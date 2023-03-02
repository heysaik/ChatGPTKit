# ChatGPTKit
A very simple Swifty API to use ChatGPT from OpenAI. Please let me know if you find any errors.

## Installation
1. In your Xcode project, go to File -> Add Packages
2. Enter the package URL: `https://https://github.com/heysaik/ChatGPTKit`
3. Click on **Add Package** and let Xcode install the Swift Package

## Usage
```swift
let chattyGPT = ChatGPTKit(apiKey: "YOUR-API-KEY")
var history = [ChatGPTKit.Message(role: .user, content: "Hello Swift ChatGPT")]

switch try await chattyGPT.performCompletions(messages: history) {
case .success(let response):
    let firstResponse = response.choices[0]
    history.append(firstResponse.message)
    print(firstResponse.message.content)
case .failure(let error):
    print(error)
}
```

## Types
This can help you understand how to use the package better. This is an exact Swift copy of the response object from the OpenAI API.
### Model
```swift
enum Model {
    case turbo
    case turbo31
}
```

### Role
```swift
enum Role {
    case assistant
    case user
    case system
}
```

### Message
```swift
struct Message {
    var role: Role
    var content: String
}
```

### APIUsage
```swift
struct APIUsage {
    var prompt_tokens: Int
    var completion_tokens: Int
    var total_tokens: Int
}
```

### ResponseChoice
```swift
struct ResponseChoice {
    var index: Int
    var message: Message
    var finish_reason: String
}
```

### Response
```swift
struct Response {
    var id: String
    var object: String
    var created: Int
    var choices: [ResponseChoice]
    var usage: APIUsage
}
```

## Compatibility 
- iOS 13.0+
- macOS 13.0+
- watchOS 9.0+
- tvOS 16.0+
