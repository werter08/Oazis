//
//  LoginView.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI



struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var loginError: Bool = false // New state for showing login error
    @Binding var isLoegIn: Bool
    
    var body: some View {
        VStack(spacing: 25) {
            
            CustomText("Oazis", type: .largeLargeTitle)
            
            Spacer()
            
            VStack(spacing: 15) {
                
                TextField("Username or Email", text: $username)
                    .disableAutocorrection(true)
                    .padding()
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: .init(lineWidth: 1))
                            .fill(.customDatkGray)
                    }
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .padding()
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: .init(lineWidth: 1))
                            .fill(.customDatkGray)
                    }
                    .foregroundColor(.white)

            }
            if isAuthenticated {
                Text("Login Successful! 🎉")
                    .foregroundColor(.green)
                    .fontWeight(.medium)
            } else if loginError {
                Text("Login Failed: Invalid username or password.")
                    .foregroundColor(.red)
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            CustomButton("Log In", color: .customGreen, fullEcran: true) {
                authenticateUser()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .disabled(username.isEmpty || password.isEmpty)
            
           
     
        }
        .padding(30)
        .background(Color.customBlack)
    }
    
    // Function to check credentials
    func authenticateUser() {
        // Reset error state on new login attempt
        loginError = false
        
        // Hardcoded credentials for example (DO NOT use in a real app)
        let validUsername = "1admin"
        let validPassword = "1admin"
        
        if username == validUsername && password == validPassword {
            isAuthenticated = true
            isLoegIn = true
            print("Login successful for: \(username)")
        } else {
            isAuthenticated = false
            loginError = true // Set error state to true
            print("Login Failed: Invalid username or password.")
        }
    }
}
