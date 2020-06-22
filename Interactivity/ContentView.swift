//
//  ContentView.swift
//  Interactivity
//
//  Created by Mayank on 18/06/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var ScreenScroll:CGFloat = .zero
    
    var body: some View {
            InteractivityHero()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
