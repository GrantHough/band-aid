import SwiftUI
import UIKit



struct DropDownVideo: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video1Completed {
            progress.lessonsFinished = 1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Introductions")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video()) {
                        Text("This lesson will introduce this course and its instructor. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video1Completed) {
                        
                    }
           //         .onTapGesture {
       //                 if progress.video1Completed {
     //                       progress.lessonsFinished = 0
     //                   }
     //                   else {
    //                        progress.lessonsFinished = 1
    //                    }
    //                }
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video1Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


struct DropDownVideo2 : View {
    
    @EnvironmentObject var progress: AppViewModel
    @State var expand = false
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Grips")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack{
                    NavigationLink (destination: Video2()) {
                        Text("This lesson will teach you about hold the stick. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    Toggle(isOn: $progress.video2Completed) {
                        
                    }
                  
                        .multilineTextAlignment(.leading)
                        //.toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                    .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
  
                    if progress.video2Completed {
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
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}



struct DropDownVideo3 : View {
    @EnvironmentObject var progress: AppViewModel
    @State var expand = false
    @State var x = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Approach")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack{
                    
                    NavigationLink (destination: Video3()) {
                        Text("This lesson will dive into approach and the mechanics that go hand in hand with it. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    
                    Toggle(isOn: $progress.video3Completed) {
                        
                    }
                  
                        .multilineTextAlignment(.leading)
                      //  .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                    .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                        
                    if progress.video3Completed {
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
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo4: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video4Completed {
            progress.lessonsFinished = 4
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("8 On a Hand")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video4()) {
                        Text("This lesson will show you your first basic percussion exercise: 8 On a Hand. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video4Completed) {
                        
                    }
       
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video4Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


struct DropDownVideo5: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video5Completed {
            progress.lessonsFinished = 5
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Stroke Types")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video5()) {
                        Text("This video will help you start to add contrast to your playing with different stroke types. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video5Completed) {
                        
                    }
   
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video5Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo6: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video5Completed {
            progress.lessonsFinished = 6
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("FDTU")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video6()) {
                        Text("This lesson will demonstrate an exercise that uses all 4 stroke types: Full, Down, Tap, Up. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video6Completed) {
                        
                    }
  
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video6Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


struct DropDownVideo7: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video7Completed {
            progress.lessonsFinished = 7
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("16th Note Builder")
                    
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video7()) {
                        Text("This video introduces another exercise: 16th Note Builder. This exercise is the first to put both of your hands together.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video7Completed) {
                        
                    }

                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video7Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo8: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video8Completed {
            progress.lessonsFinished = 8
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Bucks")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video8()) {
                        Text("This exercise introduces accents and taps in the form of bucks.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video8Completed) {
                        
                    }
       
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video8Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo9: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video9Completed {
            progress.lessonsFinished = 9
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Doubles and Triples")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video9()) {
                        Text("This lesson goes over doubles and triples. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video9Completed) {
                        
                    }
          
    //                }
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video9Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo10: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video10Completed {
            progress.lessonsFinished = 5
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("ABCD")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video10()) {
                        Text("This video goes over the exericse ABCD, which introduces double-beats and triple-beats in context. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video10Completed) {
                        
                    }
   
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video10Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo11: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video11Completed {
            progress.lessonsFinished = 11
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Multiple Bounce")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video11()) {
                        Text("This video introduces you to diddles, threes, buzz-rolls, and presses. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video11Completed) {
                        
                    }
           //         
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video11Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo12: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video12Completed {
            progress.lessonsFinished = 12
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Short Short Long")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video12()) {
                        Text("This lesson adds diddles and other multiple bounce strokes to an exercise. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video12Completed) {
                        
                    }
      
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video12Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownVideo13: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    func videoFinish() {
        if progress.video13Completed {
            progress.lessonsFinished = 13
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Conclusion")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: Video13()) {
                        Text("This video concludes the Marching Percussion Basics Course. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.video13Completed) {
                        
                    }
           //         .onTapGesture {
       //                 if progress.video1Completed {
     //                       progress.lessonsFinished = 0
     //                   }
     //                   else {
    //                        progress.lessonsFinished = 1
    //                    }
    //                }
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.video13Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}



struct MarimbaDropDownVideo: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
  
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Coming Soon!")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: MarimbaVideo1()) {
                        Text("This lesson will teach how to hold the mallet. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.marimbaVideo1Completed) {
                        
                    }
           //         .onTapGesture {
       //                 if progress.video1Completed {
     //                       progress.lessonsFinished = 0
     //                   }
     //                   else {
    //                        progress.lessonsFinished = 1
    //                    }
    //                }
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.marimbaVideo1Completed {
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct MarimbaDropDownVideo2: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
  
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Video 2")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: MarimbaVideo2()) {
                        Text("This lesson will teach about the piston stroke. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.marimbaVideo2Completed) {
                        
                    }
    //                }
                        .multilineTextAlignment(.leading)
    
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
                        //      .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .font(.system(size: 18.5, weight: .semibold))
                        .foregroundColor(Color("whiteblack").opacity(0.65))
                        .font(.system(size: 18, weight: .semibold))
                    
                        
                    if progress.marimbaVideo2Completed {
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
              
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct MarimbaDropDownVideo3: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
  
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Video 3")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    NavigationLink (destination: MarimbaVideo3()) {
                        Text("This lesson will teach how to read music. Tap here to start.")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                    }
                    
                    Toggle(isOn: $progress.marimbaVideo3Completed) {
                        
                    }
          
    //                    }
    //                }
                        .multilineTextAlignment(.leading)
              //          .toggleStyle(SwitchToggleStyle(tint: Color("tabview2")))
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.trailing)
                        .padding(.top, 2)
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
                
                
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


struct DropDownMallet1: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Introductions")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownMallet2: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Grips")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}

struct DropDownMallet3: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Scales")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


struct DropDownTrumpet1: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Introductions")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}



struct DropDownTrumpet2: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Assembly")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}



struct DropDownTrumpet3: View {
    
    @State var expand = false
    @EnvironmentObject var progress: AppViewModel
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            HStack{
                Text("Position")
                    .fontWeight(.bold)
                    .font(.system(size: 19.5, weight: .semibold))
                    .foregroundColor(Color("whiteblack").opacity(0.65))
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                Image(systemName: expand ? "chevron.up" :
                        "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(Color.white)
                
            }
            
            .onTapGesture {
                
                self.expand.toggle()
                
            }
            
            if expand {
                VStack {
                    
                    
                        Text("Coming Soon!")
                            .foregroundColor(Color("whiteblack").opacity(0.65))
                
                }
            }
        })
        .frame(width: 150)
        .padding()
        .background(Color("blueblue"))
        .cornerRadius(20)
        .animation(.spring())
        .shadow(color: Color.black.opacity(0.44), radius: 10, x: 0, y: 12)
    }
}


