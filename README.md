# ChatGPTKit
A very simple Swifty API to use ChatGPT from OpenAI. Please let me know if you find any errors.

Usage:
```swift
let chattyGPT = ChatGPTKit(apiKey: "YOUR-API-KEY")
var history = [ChatGPTKit.Message(role: .user, content: "Hello Swift ChatGPT")]

switch try await chattyGPT.performCompletions(messages: history) {
case .success(let response):
    let firstResponse = response.choices[0]
    history.append(firstReponse.message)
    print(firstResponse.message.content)
case .failure(let error):
    print(error)
}
```
