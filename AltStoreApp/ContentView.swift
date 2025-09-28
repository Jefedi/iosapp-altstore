//
//  ContentView.swift
//  AltStoreApp
//
//  Created by Developer on 28/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                    .padding()
                
                Text("Bienvenue dans votre App AltStore!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Cette application a été créée pour être distribuée via AltStore")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(spacing: 20) {
                    Text("Compteur: \(counter)")
                        .font(.title)
                        .fontWeight(.medium)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            counter += 1
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button(action: {
                            counter = max(0, counter - 1)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.bordered)
                        
                        Button(action: {
                            counter = 0
                        }) {
                            Text("Reset")
                                .font(.caption)
                        }
                        .buttonStyle(.borderless)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
            .navigationTitle("AltStore App")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}