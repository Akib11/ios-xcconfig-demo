//
//  AppConfig.swift
//  iOSConfigDemo
//
//  Created by Akib Quraishi on 02/04/2026.
//

import Foundation

enum AppEnvironment: String {
    case development
    case staging
    case production
}

enum AppConfig {
    static var apiBaseURL: URL {
        guard
            let value = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String,
            let url = URL(string: value)
        else {
            fatalError("Missing or invalid API_BASE_URL in Info.plist")
        }
        return url
    }

    static var environment: AppEnvironment {
        guard
            let value = Bundle.main.object(forInfoDictionaryKey: "APP_ENVIRONMENT") as? String,
            let env = AppEnvironment(rawValue: value.lowercased())
        else {
            fatalError("Missing or invalid APP_ENVIRONMENT in Info.plist")
        }
        return env
    }

    static var verboseLoggingEnabled: Bool {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "ENABLE_VERBOSE_LOGGING") as? String else {
            return false
        }
        return value.uppercased() == "YES"
    }
}
