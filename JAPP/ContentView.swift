import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                Spacer()
                
                // Titre de l'app
                Text("JAPP")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                // Compteur principal
                VStack(spacing: 30) {
                    Text("\(counter)")
                        .font(.system(size: 120, weight: .bold, design: .monospaced))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.secondary.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                                )
                        )
                        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: counter)
                    
                    // Boutons + et -
                    HStack(spacing: 40) {
                        // Bouton moins
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                counter -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.red, .orange],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .shadow(color: .red.opacity(0.3), radius: 10, x: 0, y: 5)
                                )
                        }
                        .scaleEffect(1.0)
                        .animation(.easeInOut(duration: 0.1), value: counter)
                        
                        // Bouton plus
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                counter += 1
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.green, .mint],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                                )
                        }
                        .scaleEffect(1.0)
                        .animation(.easeInOut(duration: 0.1), value: counter)
                    }
                }
                
                Spacer()
                
                // Bouton Reset
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        counter = 0
                    }
                }) {
                    Text("Reset")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .opacity(counter == 0 ? 0.5 : 1.0)
                .disabled(counter == 0)
                
                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.none) // Support mode sombre et clair
    }
}

#Preview {
    ContentView()
}