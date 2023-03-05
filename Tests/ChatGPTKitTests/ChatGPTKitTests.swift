import XCTest
@testable import ChatGPTKit

final class ChatGPTKitTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let chattyGPT = ChatGPTKit(apiKey: "")
        var history = [
            Message(role: .system, content: "You are a bot designed to aid mental health."),
            Message(role: .user, content: "Hello! I'm feeling rather sad today.")
        ]
        switch try await chattyGPT.performCompletions(messages: history) {
        case .success(let response):
            let firstResponse = response.choices[0]
            history.append(firstResponse.message)
            print(firstResponse.message.content)
        case .failure(let error):
            print(error.message)
        }
    }
}
