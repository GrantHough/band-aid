//
//  Video1.swift
//  RhythmX
//
//  Created by Grant Hough on 7/26/21.
//

import SwiftUI
import UIKit
import AVKit

struct Video: View {
    
   // let url = URL(string: "https://drive.google.com/file/d/1KLlWkeodigjy63uPegEYRFj-Subu3_ED/view?usp=sharing")!
    
    @EnvironmentObject var progress: AppViewModel
    //    @EnvironmentObject var progress: VideoCompletion
    
    
    var body: some View {
        
        
        ZStack (alignment: .center) {
            
            LinearGradient(gradient: Gradient(colors: [Color("black").opacity(0.6), Color("black2").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            VStack {
                
                Spacer()
                    .frame(height: 110)
                
                AdView()
                  .frame(width: 100, height: 15)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 1, y: 10)
                    .padding(.bottom, 7)
                
                
              
                Text("Video 1:")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Text("Course Introduction")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                    
                
             //  VideoPlayer(player: AVPlayer(url: url))
               //     .frame(width: 354, height: 320)
                 //   .cornerRadius(36)
                   // .padding(.bottom)
                
                VideoView(videoID: "SH097lJCI1s")
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.5)
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width * 0.9)
                    .cornerRadius(15)
                    .padding(.bottom, 7)
                    .shadow(color: Color.black.opacity(0.30), radius: 12, x: 0, y: 12)
                    
                
                ScrollView {
                    
                    HStack(alignment: .center) {
                        
                        DropDown()
                            
                            .padding(2)
                            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                        //           .padding()
                     
                        VStack(alignment: .center) {
                            Toggle(isOn: $progress.video1Completed) {
                                
                            }
                            
                            .multilineTextAlignment(.leading)
                            //  .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                            .toggleStyle(CheckboxToggleStyle2())
                            
                            //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .font(.system(size: 18.5, weight: .semibold))
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .font(.system(size: 18, weight: .semibold))
                            
                            
                            
                            if progress.video1Completed {
                                Text("Completed")
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
                       
                        .cornerRadius(20)
                        .animation(.spring())
                        .shadow(color: Color.black.opacity(0.75), radius: 10, x: 1, y: 10)
                      
                    }
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width * 0.95)
                }
             
                .frame(width: 400, height: 200)
                
                
            }.modifier(DarkModeViewModifier())
            
            
        }
        .ignoresSafeArea()
        
        
    }
    struct Video_Previews: PreviewProvider {
        
        static var previews: some View {
            
            Video()
            
            
        }
    }
    
    struct DropDown: View {
        
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
                        
                        Link("- More About Sean Clark", destination: URL(string: "https://bluedevils.org/?profilePersonID=64282")!)
                            .multilineTextAlignment(.leading)
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
