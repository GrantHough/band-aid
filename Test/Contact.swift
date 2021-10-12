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


struct Contact: View {
    
    @State var email = ""
    @State var name = ""
    @State var password = ""
    @State var message = ""
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
            
            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.6), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            ZStack {
                VStack (alignment: .center) {
                    
                    Text("Let's Chat")
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
                        
                        Text("Feel free to contact us with feedback, errors, or anything else of the sort, on the app's website.")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 1, y: 10)
                            .padding(.top, 0.2)
                        
                        Button(action: {
                            
                        }) {
                            
                            Link("Contact Us", destination: URL(string: "https://grantlhough.wixsite.com/mousa")!)
                                .foregroundColor(Color("whiteblack").opacity(0.65))
                                .frame(width: 200, height: 50)
                                .font(.system(size: 18, weight: .semibold))
                                .background(Color("blueblue"))
                                //.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.17), radius: 10, x: 0, y: 5)
                                .padding(.top, 4)
                                .shadow(color: Color.black.opacity(0.54), radius: 10, x: 0, y: 12)
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
struct Contact_Previews: PreviewProvider {
    static var previews: some View {
        
        Contact()
        
    }
}

