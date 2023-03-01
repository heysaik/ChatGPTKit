import Foundation

public struct ChatGPTKit {
    // Initializer
    private var apiKey: String!
    public init(apiKey: String!) {
        self.apiKey = apiKey
    }
    
    // MARK: Completion Endpoint
    public func performCompletions(
        model: Model = .turbo,
        messages: [Message] = [],
        temperature: Double = 1.0,
        topP: Double = 1.0,
        numberOfCompletions: Int = 1,
        presencePenalty: Double = 0,
        frequencePenalty: Double = 0
    ) async throws -> Result<Response, Error> {
        var convertedMessages = [[String:Any]]()
        for message in messages {
            convertedMessages.append(message.convertToDict())
        }
        
        let parameters: [String: Any] = [
            "model": model.rawValue,
            "messages": convertedMessages,
            "temperature": temperature,
            "top_p": topP,
            "n": numberOfCompletions,
            "presence_penalty": presencePenalty,
            "frequency_penalty": frequencePenalty
        ]
        
        switch try await createRequest(with: URL(string: Constants.baseAPIURL), parameters: parameters) {
        case .success(let baseRequest):
            do {
                let (data, _) = try await URLSession.shared.data(for: baseRequest)
                let response = try JSONDecoder().decode(Response.self, from: data)
                return .success(response)
            } catch {
                return .failure(APIError.failedToParseData)
            }
        case .failure(_):
            return .failure(APIError.requestCreationFailed)
        }
    }
    
    // MARK: PRIVATE
    private enum Constants {
        static let baseAPIURL = "https://api.openai.com/v1/chat/completions"
    }
    
    private enum APIError: Error {
        case invalidURL
        case keyNotEntered
        case couldNotReadParameters
        case requestCreationFailed
        case failedToParseData
    }
    
    private func createRequest(with url: URL?, parameters: [String: Any]) async throws -> Result<URLRequest, Error> {
        guard let apiURL = url else {
            return .failure(APIError.invalidURL)
        }
        
        guard let key = apiKey else {
            return .failure(APIError.keyNotEntered)
        }
        
        do {
            let bodyData = try JSONSerialization.data(
                withJSONObject: parameters,
                options: []
            )
            
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(key)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = bodyData
            request.timeoutInterval = 30
            return .success(request)
        } catch {
            return .failure(APIError.couldNotReadParameters)
        }
    }
}
