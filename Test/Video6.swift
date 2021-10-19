//
//  Video1.swift
//  RhythmX
//
//  Created by Grant Hough on 7/26/21.
//

import SwiftUI
import UIKit
import AVKit

struct Video6: View {
    
    let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")!
    
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
                Text("Video 5:")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Text("Full, Down, Tap, Up")
                    .foregroundColor(Color("whiteblack").opacity(0.80))
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 10)
                    .multilineTextAlignment(.center)
                
                VideoView(videoID: "MbRl7fkmBdU")
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.4)
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width * 0.9)
                    .cornerRadius(15)
                    .padding(.bottom, 7)
                    .shadow(color: Color.black.opacity(0.30), radius: 12, x: 0, y: 12)
                
                
                ScrollView {
                    
                    HStack(alignment: .center) {
                        
                        DropDown6()
                            
                            .padding(2)
                            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 1, y: 10)
                        //           .padding()
                        
                        //               NavigationLink(destination: Video2().navigationBarTitle("")
                        //
                        //                               .navigationBarHidden(true)) {
                        
                        //              Text("On to Video 2")
                        //                   .padding()
                        //                  .font(.system(size: 18, weight: .bold))
                        //                         .background(Color.blue)
                        //                      .foregroundColor(Color.white)
                        //                     .cornerRadius(20)
                        
                        //           }
                        //
                        //Toggle (
                        //        isOn: $toggleIsOn,
                        //       label: {
                        //         })
                        //         .padding(.top)
                        //        .padding(.horizontal, 200)
                        //         .toggleStyle(SwitchToggleStyle(tint: Color(.gray)))
                        
                        //    Text(toggleIsOn ? "Video Completed" : "Tap to Complete")
                        //        .font(.title2)
                        //        .fontWeight(.semibold)
                        VStack(alignment: .center) {
                            Toggle(isOn: $progress.video6Completed) {
                                
                            }
                            
                            .multilineTextAlignment(.leading)
                            //  .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                            .toggleStyle(CheckboxToggleStyle2())
                            
                            //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                            .font(.system(size: 18.5, weight: .semibold))
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                            .font(.system(size: 18, weight: .semibold))
                            
                            
                            
                            if progress.video6Completed {
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
                        // .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                        .animation(.spring())
                        .shadow(color: Color.black.opacity(0.75), radius: 10, x: 1, y: 10)
                    }
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width * 0.9)
                }
                .frame(width: 400, height: 200)
                Spacer()
                    .frame(height: 50)
                
            }.modifier(DarkModeViewModifier())
            
            
        }
        .ignoresSafeArea()
        
        
    }
    
    
    
    struct Video6_Previews: PreviewProvider {
        
        static var previews: some View {
            
            Video6()
            
            
        }
    }
    
    struct DropDown6: View {
        
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
                        
                        Link("- Lesson Sheet Music", destination: URL(string: "https://drive.google.com/file/d/1xAIaa2cUb_gaxasnmwwzpzGYQnYn8T74/view?usp=sharing")!)
                            .multilineTextAlignment(.leading)
                    }
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    
                }
            })
            .padding()
            .background(Color("blueblue"))
            .shadow(color: Color.black.opacity(0.45), radius: 10, x: 0, y: 20)
          //  .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.24), Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)).opacity(0.36)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .animation(.spring())
            
        }
    }
}
