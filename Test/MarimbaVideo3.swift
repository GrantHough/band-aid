//
//  Video1.swift
//  RhythmX
//
//  Created by Grant Hough on 7/26/21.
//

import SwiftUI
import UIKit
import AVKit

struct MarimbaVideo3: View {
    
    let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")!
    
    @EnvironmentObject var progress: AppViewModel
    //    @EnvironmentObject var progress: VideoCompletion
    
    
    var body: some View {
        
        
        ZStack (alignment: .center) {
            
            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.6), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            VStack {
                
                Spacer()
                    .frame(height: 160)
                
                Text("Video 3:")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                
                Text("Notes and Rhythms")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: 354, height: 320)
                    .cornerRadius(36)
                
                
                
                ScrollView {
                    
                    VStack(alignment: .center) {
                        
                        MarimbaDropDown3()
                            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .padding(2)
                       
                        VStack(alignment: .center) {
                            Toggle(isOn: $progress.marimbaVideo3Completed) {
                                
                            }
                            
                            .multilineTextAlignment(.leading)
                            //  .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                            .toggleStyle(CheckboxToggleStyle2())
                            
                            //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .font(.system(size: 18.5, weight: .semibold))
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .font(.system(size: 18, weight: .semibold))
                            
                            
                            if progress.marimbaVideo3Completed {
                                Text("Video Completed")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 18.5, weight: .semibold))
                                    .foregroundColor(Color("whiteblack").opacity(0.65))
                            } else {
                                Text("Finished?")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 18.5, weight: .semibold))
                                    .foregroundColor(Color("whiteblack").opacity(0.65))
                            }
                           
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 11)
                        .cornerRadius(20)
                        .background(Color("blueblue"))
                        .shadow(color: Color.black.opacity(0.75), radius: 10, x: 1, y: 10)
                        .cornerRadius(20)
                        .animation(.spring())
                        .shadow(color: Color.black.opacity(0.75), radius: 10, x: 1, y: 10)
                    }
                    
                }
                
                
            }.modifier(DarkModeViewModifier())
            
            
        }
        .ignoresSafeArea()
        
        
    }
    
    
    
    struct MarimbaVideo3_Previews: PreviewProvider {
        
        static var previews: some View {
            
            MarimbaVideo3()
            
            
        }
    }
    
    struct MarimbaDropDown3: View {
        
        @State var expand = false
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10, content: {
                
                HStack{
                    Text("Resources")
                        .fontWeight(.bold)
                        .font(.system(size: 19.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                    
                    Image(systemName: expand ? "chevron.up" :
                            "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                }
                
                .onTapGesture {
                    
                    self.expand.toggle()
                    
                }
                
                if expand {
                    
                    Button(action: {
                        
                    }) {
                        
                        Link("- Mallet Science", destination: URL(string: "https://snarescience.com")!)
                        
                    }
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    
                    Button(action: {
                        
                    }) {
                        
                        Link("- Resource 2", destination: URL(string: "https://apple.com")!)
                        
                    }
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    
                    Button(action: {
                        
                    }) {
                        
                        Link("- Resource 3", destination: URL(string: "https://apple.com")!)
                        
                    }
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    
                }
            })
            .padding()
            .background(Color("blueblue"))
            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 0, y: 20)
            .cornerRadius(20)
            .animation(.spring())
        }
    }
}
