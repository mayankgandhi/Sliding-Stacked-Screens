//
//  SwiftUIView.swift
//  Interactivity
//
//  Created by Mayank on 18/06/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

extension View  {
    var screenWidth:CGFloat {
        return UIScreen.main.bounds.width
    }
    var screenHeight:CGFloat   {
        return UIScreen.main.bounds.height
    }
}

struct InteractivityHero: View {
    
    @State var yOffset:CGFloat = .zero
    
    var body: some View {
        
        ZStack {
            GeometryReader  { geometry in
                VStack  {
                    Text("Interactivity Post Title").font(.title)
                    Text("This is the interactivity post content where the information will be placed.")
                    Text("Y-Offset \(self.yOffset.description)")
                }
                .gesture(
                    DragGesture()
                        .onChanged( { (dragValue) in
                        self.yOffset =  dragValue.translation.height
                        }
                    )
                        .onEnded ({ (dragValue) in
                            if dragValue.translation.height < -200   {
                                self.yOffset = -1 * self.screenHeight/1.5
                            } else if ( dragValue.translation.height < -40 )  {
                                self.yOffset = -1 * self.screenHeight/4
                            } else  {
                                self.yOffset = 0
                            }
                        })
                )
                    .offset(y: 300 + self.yOffset)
                    .animation(.interactiveSpring())
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InteractivityHero()
    }
}
