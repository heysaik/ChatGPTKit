import XCTest
@testable import ChatGPTKit

final class ChatGPTKitTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let chattyGPT = ChatGPTKit(apiKey: "")
        let messages = [Message(role: .user, content: "Hello! How are you doing?")]
        switch try await chattyGPT.performCompletions(messages: messages) {
        case .success(let response):
            print(response.choices?[0].message.content)
        case .failure(let error):
            print(error)
        }
    }
}
