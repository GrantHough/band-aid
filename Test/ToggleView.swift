//
//  ToggleView.swift
//  RhythmX
//
//  Created by Grant Hough on 7/21/21.
//

import SwiftUI

struct ToggleView: View {
    
    @State var isChecked: Bool = true
    
    var body: some View {
        Toggle(isOn: self.$isChecked) {
           Text("bungimungi")
            if (self.isChecked) {
                
            }
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
