//
//  InteractivityImage.swift
//  Interactivity
//
//  Created by Mayank on 18/06/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

struct InteractivityImage: View {
    
    @Binding var imageOpacity:Double

    var body: some View {
        ZStack{
            Image("Walk").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
            Color.black.opacity( self.imageOpacity )
                .edgesIgnoringSafeArea(.all)
        }
    }
}

//struct InteractivityImage_Previews: PreviewProvider {
//    static var previews: some View {
//        InteractivityImage()
//    }
//}
