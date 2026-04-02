//
//  ContentView.swift
//  iOSConfigDemo
//
//  Created by Akib Quraishi on 02/04/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var requestURL: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("iOS Config Demo")
                        .font(.title2.bold())
                    
                    Spacer()
                    
                    EnvironmentBadgeView(environment: AppConfig.environment)
                }
                
                infoCard(
                    title: "Environment",
                    value: AppConfig.environment.rawValue.capitalized,
                    systemImage: "shippingbox"
                )
                
                infoCard(
                    title: "Base URL",
                    value: AppConfig.apiBaseURL.absoluteString,
                    systemImage: "network"
                )
                
                infoCard(
                    title: "Verbose Logging",
                    value: AppConfig.verboseLoggingEnabled ? "Enabled" : "Disabled",
                    systemImage: "ladybug"
                )
                
                Button {
                    let request = APIClient.shared.makeDemoRequest()
                    requestURL = request.url?.absoluteString ?? "Invalid URL"
                } label: {
                    Text("Build Demo Request")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                if !requestURL.isEmpty {
                    infoCard(
                        title: "Generated Request",
                        value: requestURL,
                        systemImage: "arrow.up.right.square"
                    )
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Config Demo")
        }
    }
    @ViewBuilder
    private func infoCard(title: String, value: String, systemImage: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: systemImage)
                .font(.headline)
            
            Text(value)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
