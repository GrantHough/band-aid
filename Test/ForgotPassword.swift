//
//  ForgotPassword.swift
//
//
//  Created by Grant Hough on 7/28/21.
//

import SwiftUI
import FirebaseAuth
import UIKit
import GoogleSignIn


struct ForgotPassword: View {
    
    @State var email = ""
    @State var password = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    @State private var alertIsPresented2 = false
    @State private var alertIsShowing = false
    @State private var errString: String?
    @State private var resetAlert = false
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Invalid Log-in", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        
        //     present(alert, animated: true)
        
    }
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.5), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            ZStack {
                VStack (alignment: .center) {
                    
                    Text("Forgot Your Password?")
                        .fontWeight(.bold)
                        .padding(2)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(Color("whiteblack").opacity(0.8))
                        .multilineTextAlignment(.center)
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.35), radius: 10, x: 0, y: 7)
                    
                    
                    VStack {
                        
                        TextField("Email Address", text: $email)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding()
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .background(LinearGradient(gradient: Gradient(colors: [Color("blackblack2").opacity(0.18), Color("blackblack2").opacity(0.24)]), startPoint: .leading, endPoint: .trailing))
                            //    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                        
                        
                        Button(action: {
                            
                            guard !email.isEmpty else {
                                
                                return()
                                
                            }
                            
                            
                            viewModel.resetPassword(email: email) { (result) in
                                switch result {
                                case .failure(let error):
                                    self.errString = error.localizedDescription
                                case .success( _):
                                    break
                                }
                                self.resetAlert = true
                                
                            }
                            
                           
                            
                        }, label: {
                            Text("Send Reset Email")
                                .foregroundColor(Color("whiteblack").opacity(0.65))
                                .frame(width: 200, height: 50)
                                .font(.system(size: 18, weight: .semibold))
                               // .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                                .background(Color("blueblue"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.17), radius: 10, x: 0, y: 5)
                                .padding(.top, 4).shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                                .alert(isPresented: $resetAlert) {
                                    Alert(title: Text("Password Reset"),
                                          message: Text(self.errString ?? "Success. Reset email sent succcessfully. Check your email inbox."),
                                          dismissButton: .default(Text("Dismiss"))
                                          
                                          )
                                    
                                    
                                }
                            
                        })
                        
                        
                    }
                    .padding()
                    
                    
                }
                
                .padding()
                
                Spacer()
                    .frame(height:100)
                
            }.modifier(DarkModeViewModifier2())
        }
        .ignoresSafeArea()
    }
    
}
struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        
        ForgotPassword()
        
    }
}

