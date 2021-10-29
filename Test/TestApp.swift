//
//  RhythmXApp.swift
//  RhythmX
//
//  Created by Grant Hough on 6/25/21.
//
import FirebaseAuth
import SwiftUI
import Firebase
import UIKit
import GoogleSignIn
import GoogleMobileAds


@main
struct RhythmXApp: App {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("videoCompleted1") private var videoCompleted = false
    @AppStorage("videoCompleted2") private var videoCompleted2 = false
    @AppStorage("videoCompleted3") private var videoCompleted3 = false
    @AppStorage("videoCompleted4") private var videoCompleted4 = false
    @AppStorage("videoCompleted5") private var videoCompleted5 = false
    @AppStorage("videoCompleted6") private var videoCompleted6 = false
    @AppStorage("videoCompleted7") private var videoCompleted7 = false
    @AppStorage("videoCompleted8") private var videoCompleted8 = false
    @AppStorage("videoCompleted9") private var videoCompleted9 = false
    @AppStorage("videoCompleted10") private var videoCompleted10 = false
    @AppStorage("videoCompleted11") private var videoCompleted11 = false
    @AppStorage("videoCompleted11") private var videoCompleted12 = false
  
 
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            
            ContentView()
                .environmentObject(viewModel)
                .modifier(DarkModeViewModifier2())
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
        
    }
}

