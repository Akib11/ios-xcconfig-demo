//
//  EnvironmentBadgeView.swift
//  iOSConfigDemo
//
//  Created by Akib Quraishi on 02/04/2026.
//

import Foundation
import SwiftUI

struct EnvironmentBadgeView: View {
    let environment: AppEnvironment

    var title: String {
        switch environment {
        case .development: return "DEVELOPMENT"
        case .staging: return "STAGING"
        case .production: return "PRODUCTION"
        }
    }

    var tint: Color {
        switch environment {
        case .development: return .blue
        case .staging: return .orange
        case .production: return .green
        }
    }

    var body: some View {
        Text(title)
            .font(.caption.weight(.bold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(tint.opacity(0.18))
            .foregroundStyle(tint)
            .clipShape(Capsule())
    }
}
