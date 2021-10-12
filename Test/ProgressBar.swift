//
//  ProgressBar.swift
//  RhythmX
//
//  Created by Grant Hough on 7/18/21.
//

import SwiftUI

struct ProgressBar: View {
    
    
    @EnvironmentObject var progress: AppViewModel
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 0
    var color1 = Color(#colorLiteral(red: 0.4427878261, green: 0.4428665042, blue: 0.4427774549, alpha: 1))
    var color2 = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
       
    
    
    func videoCompletion() {
        if progress.video1Completed {
            progress.lessonsFinished = 1
        }
        
        if progress.video2Completed {
            progress.lessonsFinished = 2.02
        }
        
        if progress.video3Completed{
            progress.lessonsFinished = 3.03
        }
    }
    var body: some View {
        
        
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.12))
                .shadow(color: Color.black.opacity(0.24), radius: 10, x: 0, y: 7)
        
        
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: 1 * percent * 2, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
            
        }
       
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
