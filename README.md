# ChatGPTKit
A very simple Swifty API to use ChatGPT from OpenAI. Please let me know if you find any errors.

## Installation
1. In your Xcode project, go to File -> Add Packages
2. Enter the package URL: `https://https://github.com/heysaik/ChatGPTKit`
3. Click on **Add Package** and let Xcode install the Swift Package

## Usage
```swift
let chattyGPT = ChatGPTKit(apiKey: "YOUR-API-KEY")
var history = [Message(role: .system, content: "You are a bot designed to aid mental health."), Message(role: .user, content: "Hello! I'm feeling rather sad today.")]

switch try await chattyGPT.performCompletions(messages: history) {
case .success(let response):
    let firstResponse = response.choices[0]
    history.append(firstResponse.message)
    print(firstResponse.message.content)
case .failure(let error):
    print(error.message)
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
Typically, a conversation is formatted with a system message first, followed by alternating user and assistant messages.
- The system message helps set the behavior of the assistant.
- The user messages help instruct the assistant. They can be generated by the end users of an application, or set by a developer as an instruction.
- The assistant messages help store prior responses. They can also be written by a developer to help give examples of desired behavior.

```swift
enum Role {
    case system
    case user
    case assistant
}
```

### Message
Messages must be an array of message objects, where each object has a role (either “system”, “user”, or “assistant”) and content (the content of the message). Conversations can be as short as 1 message or fill many pages.
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

### APIError
APIError is the default Error type this package returns. If the OpenAI API returns an error, it will be of this type and you can get the code, message, and type. If there is another error from the client side, you can read the error property to understand the error.
```swift
struct APIError: Error {
    public var code: Int?
    public var message: String
    public var type: String?
    public var error: Error?
    
    public init(code: Int? = nil, message: String, type: String? = nil, error: Error? = nil) {
        self.code = code
        self.message = message
        self.type = type
        self.error = error
    }
}
```

### ErrorResponse
```swift
struct ErrorResponse {
    var error: APIError
}
```

## Compatibility 
- iOS 13.0+
- macOS 13.0+
- watchOS 9.0+
- tvOS 16.0+
