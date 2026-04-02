//
//  APIClient.swift
//  iOSConfigDemo
//
//  Created by Akib Quraishi on 02/04/2026.
//

import Foundation

final class APIClient {
    static let shared = APIClient()

    private init() {}

    var baseURL: URL {
        AppConfig.apiBaseURL
    }

    func makeDemoRequest() -> URLRequest {
        
        print("ENV:", AppConfig.environment.rawValue)
        print("URL:", AppConfig.apiBaseURL.absoluteString)
        
        let url = baseURL.appendingPathComponent("health")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        if AppConfig.verboseLoggingEnabled {
            print("🌍 ENV:", AppConfig.environment.rawValue)
            print("🔗 Request URL:", url.absoluteString)
        }

        return request
    }
}
