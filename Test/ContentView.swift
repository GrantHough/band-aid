//
//  ContentView.swift
//  RhythmX
//
//  Created by Grant Hough on 6/25/21.
//

import FirebaseAuth
import SwiftUI
import UIKit
import AVKit
import GoogleSignIn
import GoogleMobileAds 



class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @State private var alertIsShowing = false  // not using
    @Published var signedIn = false
    @State var alertMessage = "Something went wrong."
    @State var isSuccessful = false
    @State var showRealAlert = false
    @State var error = false
    @State var alertShows = false
    @State var errString: String?
    @Published var signInAlert = false
    
    @AppStorage("video1Completed") var video1Completed = false
    @AppStorage("video2Completed") var video2Completed = false
    @AppStorage("video3Completed") var video3Completed = false
    @AppStorage("video4Completed") var video4Completed = false
    @AppStorage("video5Completed") var video5Completed = false
    @AppStorage("video6Completed") var video6Completed = false
    @AppStorage("video7Completed") var video7Completed = false
    @AppStorage("video8Completed") var video8Completed = false
    @AppStorage("video9Completed") var video9Completed = false
    @AppStorage("video10Completed") var video10Completed = false
    @AppStorage("video11Completed") var video11Completed = false
    @AppStorage("video12Completed") var video12Completed = false
    @AppStorage("video13Completed") var video13Completed = false
    
    
    @AppStorage("marimbaVideo1Completed") var marimbaVideo1Completed = false
    @AppStorage("marimbaVideo2Completed") var marimbaVideo2Completed = false
    @AppStorage("marimbaVideo3Completed") var marimbaVideo3Completed = false
    
    @Published var resetAlert = false
    @Published var completed = false
    @Published var completed2 = false
    @Published var completed3 = false
    
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    
    func lessonsFinishing() {
        
        if video1Completed {
            lessonsFinished = 1
        }
        
    }
    func videoCompletion() {
        if video1Completed {
            lessonsFinished = 1
        }
        
        if video2Completed {
            lessonsFinished = 2
        }
        
        if video3Completed {
            lessonsFinished = 3
        }
    }
    
    
    @Published var lessonsFinished: CGFloat = 0
    
    
    //  let alert = Alert (title: Text("dog"), message: Text("dog"), dismissButton: .cancel())
    
    
  
    
    
    func signIn(email: String, password: String) { //login
        auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in  
            
            
            
            if error != nil {
                self?.alertMessage = error?.localizedDescription ?? ""
                print("\(String(describing: error))")
                self?.alertIsShowing = true
                self?.showRealAlert = true
                self!.error = true
                self?.errString = error?.localizedDescription
                self?.signInAlert = true
            }
            
            
            else {
                self?.isSuccessful = true
                print("Signed In")
              
                
                
            }
            
            
            guard result != nil, error == nil else {
                self?.alertIsShowing = true
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            if error != nil {
                self?.signInAlert = true
            }
            
            
            
            guard result != nil, error == nil else {
                self?.alertIsShowing = true
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func resetPassword(email: String, resetCompletion: @escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            
            if error != nil {
                self.resetAlert = true
            }
            
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        })
    }
    
    
    
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    
}





struct CheckboxToggleStyle: ToggleStyle {
    
    @EnvironmentObject var progress: AppViewModel
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
            .onTapGesture {
                if progress.video1Completed {
                    progress.lessonsFinished = 1
                }
                else {
                    progress.lessonsFinished = 0
                }
            }
            .padding(5)
            .padding(.leading)
            .font(.title2)
        }
    }
}

struct CheckboxToggleStyle2: ToggleStyle {
    
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Button {
                configuration.isOn.toggle()
                
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
            .padding(1)
            .font(.title2)
        }
    }
}

struct AdView : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-7580349031960098~7305173869"
      //  banner.adUnitID = "ca-app-pub-7580349031960098~7305173869"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        banner.backgroundColor = UIColor(Color("blueblue"))
        return banner
        
        
    }
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
        
    }
}



struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State private var alertIsPresented = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    weak var checkCollectionView: UICollectionView!
    @State var percent: CGFloat = 7.694
    let objectColors = SegmentColor.allCases
    @State private var selectedColor = SegmentColor.gray
    @State var multiplier: CGFloat = 0
    
   
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1067320949)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor(named: "segmentedcolor")], for: .normal)
        UITabBar.appearance().barTintColor = UIColor(named: "tabview")
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.273171097, green: 0.272729367, blue: 0.2735350132, alpha: 1)
        
    }
    
    
    func Multiply() {
        if viewModel.video1Completed {
            multiplier = 1
        }
        
        if viewModel.video2Completed {
            multiplier = 2.02
        }
        
        if viewModel.video3Completed{
           multiplier = 3.03
        }
    }
    
    func videoCompletion() {
        if viewModel.video1Completed {
            viewModel.lessonsFinished = 1
        }
        
        if viewModel.video2Completed {
            viewModel.lessonsFinished = 2.02
        }
        
        if viewModel.video3Completed{
            viewModel.lessonsFinished = 3.03
        }
    }
    
    var body: some View {
        
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    TabView {
                        ZStack {
                            

                            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.5), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                         
                            
                            VStack{
                                
                                Text("Courses")
                                    .foregroundColor(Color("whiteblack").opacity(0.80))
                            
                                    .font(.system(size: 48, weight: .bold, design: .rounded))
                                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                                    
                                
                                HStack (alignment: .center) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack (alignment: .center) {
                                            
                                            
                                            HStack (alignment: .center) {
                                                
                                                VStack (alignment: .center) {
                                                    
                                                    
                                                    
                                                    Text("Battery Basics")
                                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                        .padding(.top, 24)
                                                    
                                                    
                                                    
                                                    ScrollView {
                                                        
                                                        Group {
                                                        DropDownVideo()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            
                                                            .padding(.top, 10)
                                                        //       DropDownVideo()
                                                        //          .padding(.horizontal)
                                                        
                                                        
                                                        DropDownVideo2()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        
                                                        
                                                        DropDownVideo3()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                           .padding(.vertical, 2)
                                                        
                                                        
                                                        DropDownVideo4()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        
                                                        DropDownVideo5()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        
                                                        DropDownVideo6()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        DropDownVideo7()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        }
                                                        DropDownVideo8()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                           .padding(.vertical, 2)
                                                        
                                                        
                                                        DropDownVideo9()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        
                                                        DropDownVideo10()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        
                                                        DropDownVideo11()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                        DropDownVideo12()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)
                                                            
                                                        DropDownVideo13()
                                                            .padding(.horizontal, 8)
                                                            
                                                            
                                                            .padding(.vertical, 2)

                                                            .padding(.bottom, 10)
                                                        
                                                    }
                                                    .frame(height: 150)
                                                    .background(LinearGradient(gradient: Gradient(colors: [Color(.black).opacity(0.12), Color(.black).opacity(0.16)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .cornerRadius(20)
                                                    
                                                 
                                                    if viewModel.video13Completed {
                                                     ProgressBar(width: 200, height: 20, percent: percent * 13, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                         .animation(.spring())
                                                         .padding(.top, 4)
                                                     
                                                        Text("\(Int(percent * 13.01))% Completed")
                                                         .foregroundColor(Color("whiteblack").opacity(0.65))
                                                         .font(.title3)
                                                         .padding(.bottom, 12)
                                                         .animation(.spring())
                                                     
                                                 }
                                                    
                                             else if viewModel.video12Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 12, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                    Text("\(Int(percent * 12.01))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                                    
                                                    
                                             else if viewModel.video11Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 11, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                Text("\(Int(percent * 11.01))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                             else if viewModel.video10Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 10, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                Text("\(Int(percent * 10.01))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                             else if viewModel.video9Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 9, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 9))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                             else if viewModel.video8Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 8, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 8))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                            else if viewModel.video7Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 7, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 7))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                                    
                                            else if viewModel.video6Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 6, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 6))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                                    
                                            else if viewModel.video5Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 5, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 5))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                                    
                                                    
                                            else if viewModel.video4Completed {
                                                 ProgressBar(width: 200, height: 20, percent: percent * 4, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                     .animation(.spring())
                                                     .padding(.top, 4)
                                                 
                                                 Text("\(Int(percent * 4))% Completed")
                                                     .foregroundColor(Color("whiteblack").opacity(0.65))
                                                     .font(.title3)
                                                     .padding(.bottom, 12)
                                                     .animation(.spring())
                                                 
                                             }
                                                    
                                            else if viewModel.video3Completed {
                                                        ProgressBar(width: 200, height: 20, percent: percent * 3.02, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                            .animation(.spring())
                                                            .padding(.top, 4)
                                                        
                                                        Text("\(Int(percent * 3.02))% Completed")
                                                            .foregroundColor(Color("whiteblack").opacity(0.65))
                                                            .font(.title3)
                                                            .padding(.bottom, 12)
                                                            .animation(.spring())
                                                        
                                                    }
                                                    
                                                    else if viewModel.video2Completed {
                                                        ProgressBar(width: 200, height: 20, percent: percent * 2.03, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                            .animation(.spring())
                                                            .padding(.top, 4)
                                                        
                                                        Text("\(Int(percent * 2.03))% Completed")
                                                            .foregroundColor(Color("whiteblack").opacity(0.65))
                                                            .font(.title3)
                                                            .padding(.bottom, 12)
                                                            .animation(.spring())
                                                        
                                                    }
                                                    
                                                    
                                                    
                                                    else if viewModel.video1Completed {
                                                        ProgressBar(width: 200, height: 20, percent: percent * 1, color1: Color("blueblue2").opacity(1), color2: Color("blueblue2").opacity(1)) // c
                                                            .animation(.spring())
                                                            .padding(.top, 4)
                                                        
                                                        Text("\(Int(percent * 1))% Completed")
                                                            .foregroundColor(Color("whiteblack").opacity(0.65))
                                                            .font(.title3)
                                                            .padding(.bottom, 12)
                                                            .animation(.spring())
                                                        
                                                    }
                                                    
                                                    else {
                                                        ProgressBar(width: 200, height: 20, percent: percent * 0, color1: Color(#colorLiteral(red: 0.01621650159, green: 0.7055159807, blue: 1, alpha: 1)).opacity(0.29), color2: Color(#colorLiteral(red: 0.672437489, green: 0.2107742131, blue: 1, alpha: 1)).opacity(0.39)) // c
                                                            .animation(.spring())
                                                            .padding(.top, 4)
                                                        
                                                        Text("\(Int(percent * 0))% Completed")
                                                            .foregroundColor(Color("whiteblack").opacity(0.65))
                                                            .font(.title3)
                                                            .padding(.bottom, 12)
                                                            .animation(.spring())
                                                        
                                                        
                                                    }
                                                    
                                                    //                Button(action: { percent = CGFloat.random(in: 0...100) }, label: {
                                                    //                Text("Generate Random Percentage")
                                                    //             })
                                                    
                                                }
                                                .frame(width: 220, height: 300)
                                                .background(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.48)]), startPoint: .leading, endPoint: .trailing))
                                                .cornerRadius(26)
                                                
                                                
                                                
                                            }
                                            //      .frame(height: 300)
                                            .cornerRadius(16)
                                           
                                            HStack (alignment: .center) {
                                                
                                                VStack (alignment: .center) {
                                                    
                                                    
                                                    
                                                    Text("Mallet Basics")
                                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                        .padding(.top, 24)
                                                    
                                                    Text("Coming Soon!")
                                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                      
                                                    
                                                    
                                                
                                                    //                Button(action: { percent = CGFloat.random(in: 0...100) }, label: {
                                                    //                Text("Generate Random Percentage")
                                                    //             })
                                                    
                                                }
                                                .frame(width: 220, height: 300)
                                                .background(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.32)]), startPoint: .leading, endPoint: .trailing))
                                                .cornerRadius(26)
                                                
                                                
                                                
                                            }
                                            //      .frame(height: 300)
                                            .cornerRadius(16)
                                            
                                            
                                            
                                            //   .padding(.leading, 10)
                                        
                                            //   .padding(.leading, 10)
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    .frame(height: 300)
                                    .cornerRadius(28)
                                    .padding()
                                    .ignoresSafeArea()
                                }
                                .background(Color("blackblack").opacity(0.12))
                                .cornerRadius(40)
                                .frame(width: 352, height: 320)
                                .shadow(color: Color.black.opacity(0.6), radius: 12, x: 7, y: 20)
                                
                               
                                
                            }
                            
                            .ignoresSafeArea()
                            Spacer()
                        }
                        .ignoresSafeArea()
                        
                        
                        .tabItem {
                            Image(systemName: "book")
                            Text("Courses")
                        }
                        
                        
                        ScrollView {
                            
                            Spacer()
                            
                            VStack {
                                
                                Spacer()
                                
                                Text("Settings")
                                    .font(.system(size: 48, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("whiteblack").opacity(0.8))
                                    .padding(.bottom)
                                
                                
                                Picker("Mode", selection: $isDarkMode) {
                                    Text("Light/Gray")
                                        .tag(false)
                                    Text("Dark/Colorful")
                                        .tag(true)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .padding(.horizontal, 86)
                                .padding(.top)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("whiteblack2").opacity(0.65))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 1, y: 10)
                                //    .onChange(of: selectedColor) { _ in }
                                Spacer()
                                
                                
                      
                                
                                NavigationLink(destination: ChangePassword()) {
                                    Text("Change Password")
                                        .frame(width: 200, height: 50)
                                        .background(Color("blueblue"))
                                        .font(.system(size: 20.3, weight: .semibold))
                                        //            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 1, y: 10)
                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                                        .padding(.top, 1.5)
                                }
                                
                                
                                
                                Button(action: {
                                    
                                    viewModel.signOut()
                                    
                                }, label: {
                                    
                                    Text("Sign Out")
                                        .frame(width: 200, height:50)
                                        .background(Color("blueblue"))
                                        .font(.system(size: 20, weight: .semibold))
                                        //            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 1, y: 10)
                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                                        .padding(.top, 1.5)
                                    

                                    
                                })
                                
                                NavigationLink(destination: Contact()) {
                                    Text("Contact Us")
                                        .font(.system(size: 20, weight: .semibold))
                                        //            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 1, y: 10)
                                        .foregroundColor(Color("whiteblack").opacity(0.65))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                                        .padding(.top, 1)
                                }
                                
                                Text("Tempus Version 1.00")
                                    .font(.system(size:13))
                                    .foregroundColor(Color("whiteblack").opacity(0.8))
                                
                            }
                            
                        }
                        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.5), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .ignoresSafeArea()
                        
                        .ignoresSafeArea()
                        
                        .tabItem {
                            Image(systemName:"gear")
                            Text("Settings")
                        }
                    }
                    .modifier(DarkModeViewModifier())
                    
                }
            }
            else {
                SignInView()
                
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
            
        }
    }
    //    .environmentObject(videoCompletion)
}


enum SegmentColor: String, CaseIterable, Identifiable {
    case gray
    
    var id: String { rawValue }
    
    var color: UIColor {
        
        switch self {
        
        case .gray: return .gray
            
        }
        
    }
    
}




public struct DarkModeViewModifier: ViewModifier {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    
    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

struct DarkModeColorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

public struct DarkModeViewModifier2: ViewModifier {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    //oops
    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

struct DarkModeColorView_Previews2: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            ContentView()
            
        }
    }//oops
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}

