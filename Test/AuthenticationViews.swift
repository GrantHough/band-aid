//
//  AuthenticationViews.swift
//  RhythmX
//
//  Created by Grant Hough on 7/28/21.
//

import SwiftUI
import UIKit
import FirebaseAuth

struct SignUpView: View {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    @State private var alertIsPresented = false
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.5), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                
                Text("Let's Get Started")
                    .fontWeight(.bold)
                    .padding(2)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color("whiteblack").opacity(0.8))
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.39), radius: 10, x: 0, y: 7)
                
                VStack {
                    
                    TextField("Email Address", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .padding(.top, 3)
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("blackblack2").opacity(0.18), Color("blackblack2").opacity(0.24)]), startPoint: .leading, endPoint: .trailing))
                        //        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("blackblack2").opacity(0.18), Color("blackblack2").opacity(0.24)]), startPoint: .leading, endPoint: .trailing))
                        //     .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else{
                            self.viewModel.signInAlert = true
                            return()
                        }
                        
                        viewModel.signUp(email: email, password: password)
                        
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .frame(width: 200, height: 50)
                          //  .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                            .background(Color("blueblue"))
                            .font(.system(size: 18, weight: .semibold))
                            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .cornerRadius(8)
                            .padding(.top, 4).shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                            .alert(isPresented: $viewModel.signInAlert) {
                                Alert(title: Text("Hey there!"),
                                      message: Text(self.viewModel.errString ?? "Something went wrong."),
                                      dismissButton: .default(Text("Dismiss"))
                                      
                                )
                           
                            }
                    })
                }
                .padding()
                Spacer()
                    .frame(height:110)
            }.modifier(DarkModeViewModifier2())
        }
        .ignoresSafeArea()
        
    }
    
}

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    @State private var alertIsPresented2 = false
    @State private var alertIsShowing = false
    
    
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
                VStack {
                    Text("band+aid")
                        .fontWeight(.bold)
                        .padding(2)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(Color("whiteblack").opacity(0.8))
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.35), radius: 10, x: 0, y: 6)
                    
                    
                    VStack {
                        
                        NavigationLink (destination: RealSignInView()) {
                            Text("Sign In")
                                .frame(width: 200, height: 50)
                              //  .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                                .background(Color("blueblue"))
                                .foregroundColor(Color("whiteblack").opacity(0.65))
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                                .font(.system(size: 18, weight: .semibold))
                                .cornerRadius(10)
                                .padding(0.8)
                                .shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
                        }
                        
                        NavigationLink (destination: SignUpView()) {
                            Text("Sign Up")
                                .frame(width: 200, height: 50)
                                .background(Color("blueblue"))
                               
                                .foregroundColor(Color("whiteblack").opacity(0.65))
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                                .font(.system(size: 18, weight: .semibold))
                                .cornerRadius(10)
                                .padding(0.8)
                                .shadow(color: Color.black.opacity(0.47), radius: 10, x: 0, y: 10)
                        }
                    
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


struct RealSignInView: View {
    
    @State var email = ""
    @State var password = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    @State private var alertIsPresented2 = false
    @State private var alertIsShowing = false
    @State private var realAlert = false
    
    
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
                VStack {
                    
                    Text("Welcome Back")
                        .fontWeight(.bold)
                        .padding(2)
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Color("whiteblack").opacity(0.8))
                    
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
                            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                        
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding()
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .background(LinearGradient(gradient: Gradient(colors: [Color("blackblack2").opacity(0.18), Color("blackblack2").opacity(0.24)]), startPoint: .leading, endPoint: .trailing))
                            //        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                        
                        Button(action: {
                            
                            guard !email.isEmpty, !password.isEmpty else {
                                self.viewModel.signInAlert = true
                                return()
                                
                            }
                            
                            viewModel.signIn(email: email, password: password)
                            
                        }, label: {
                            Text("Sign In")
                                .foregroundColor(Color("whiteblack").opacity(0.65))
                                .frame(width: 200, height: 50)
                                .font(.system(size: 18, weight: .semibold))
                                .background(Color("blueblue"))
                               // .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .padding(.top, 4)
                                .shadow(color: Color.black.opacity(0.47), radius: 10, x: 0, y: 10)
                                
                                .alert(isPresented: $viewModel.signInAlert) {
                                    Alert(title: Text("Hey there!"),
                                          message: Text(self.viewModel.errString ?? "Something went wrong."),
                                          dismissButton: .default(Text("Dismiss"))
                                          
                                    )
                                }
                        })
                        
                        NavigationLink("Forgot Password?", destination: ForgotPassword())
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(0.8)
                        
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

