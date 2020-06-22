
//
//  SwiftUIView.swift
//  Interactivity
//
//  Created by Mayank on 18/06/20.
//  Copyright © 2020 Mayank. All rights reserved.
//
import SwiftUI
extension View {
    var screenWidth:CGFloat {
        return UIScreen.main.bounds.width
    }

    var screenHeight:CGFloat   {
        return UIScreen.main.bounds.height
    }

}
struct InteractivityHero: View {
    @State var scrollState:CGFloat = .zero
    @State var backgroundOpacity:Double = 0
    @State var tabPicker:Int = 0
    let op:Double = 0.6
    var body: some View {
        ZStack {
            InteractivityImage(imageOpacity: $backgroundOpacity).frame(width: screenWidth, height: screenHeight)
            GeometryReader  {
                geometry in
                VStack  {
                    HStack {
                        VStack{
                            Text("Pete's Road Trip").font(.title)
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                Text("Western, United States")
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Circle().frame(width: 50, height: 40).foregroundColor(Color.white)
                            Text("@PeteyPete").bold()
                        }
                    }
                    .padding()
                    .background(BlurView(.extraLight))
                    .cornerRadius(20).padding()
                    
                    VStack  {
                        VStack(alignment: .leading) {
                            Text("I really liked this hike because it was very liberating and it was my first solo hike!")
                        }
                        .padding(.bottom).fixedSize(horizontal: false, vertical: true)
                        HStack{
                            VStack{
                                Image(systemName: "sun.max")
                                Text("Backpacker").font(.caption)
                            }
                            VStack{
                                Image(systemName: "sun.max")
                                Text("Hiking").font(.caption)
                            }
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Image(systemName: "square.and.arrow.up").font(.system(size: 20)).padding(.horizontal, 10)
                            }
                            Button(action: {
                                
                            }) {
                                Image(systemName: "plus").font(.system(size: 20)).padding(.trailing, 10)
                            }
                            Button(action: {
                                
                            }) {
                                Image(systemName: "message").font(.system(size: 20))
                            }
                        }
                    }
                    .padding()
                    .background(BlurView(.extraLight))
                    .cornerRadius(20).padding()
                    
                    
                    Picker(selection: self.$tabPicker, label: Text("")) {
                        Text("Trip Information").tag(0)
                        Text("Social").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 30)
                    if self.tabPicker == 0 {
                        VStack  {
                            HStack {
                                Text("Trip Information".uppercased()).font(.caption).bold()
                                Spacer()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    Text("Level of the Hike".uppercased()).font(.caption).bold()
                                    Text("Hard").font(.caption)
                                }.padding(.bottom)
                                VStack(alignment: .leading){
                                    Text("Terrain".uppercased()).font(.caption).bold()
                                    HStack{
                                        Text("Gravel").font(.caption)
                                        Text("Shadow").font(.caption)
                                    }
                                }.padding(.bottom)
                                VStack(alignment: .leading){
                                    Text("Backpacker Level".uppercased()).font(.caption).bold()
                                    HStack{
                                        Text("Beginner").font(.caption)
                                    }
                                }.padding(.bottom)
                                VStack(alignment: .leading){
                                    Text("Gear".uppercased()).font(.caption).bold()
                                    HStack{
                                        Text("Mountain Shoes, Pole, Water Bottle").font(.caption)
                                    }
                                }.padding(.bottom)
                                VStack(alignment: .leading){
                                    Text("Water Source on the way".uppercased()).font(.caption).bold()
                                    Text("None").font(.caption)
                                }.padding(.bottom)
                                VStack(alignment: .leading){
                                    Text("Essentials".uppercased()).font(.caption).bold()
                                    Text("This Hike is a great beginner level hike. You can see elks on the way if you stop on Grand Lake on the way to Pikes Peak. Highly Recommended!").font(.caption).fixedSize(horizontal: false, vertical: true)
                                }.padding(.bottom)
                            }
                        }
                        .padding()
                        .background(BlurView(.extraLight))
                        .cornerRadius(20).padding()
                    }
                    else  {
                        VStack  {
                            
                            HStack {
                                Text("Social".uppercased()).font(.caption).bold()
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack{
                                HStack{
                                    Image(systemName: "message").font(.system(size: 20))
                                    Text("242").font(.caption)
                                }
                                HStack{
                                    Image(systemName: "plus").font(.system(size: 20))
                                    Text("330").font(.caption)
                                }
                                .padding(.horizontal, 20)
                                HStack{
                                    Image(systemName: "square.and.arrow.up").font(.system(size: 20))
                                    Text("108").font(.caption)
                                }
                                Spacer()
                            }.padding(.bottom)
                            
                            VStack(alignment: .leading){
                                VStack(alignment: .leading) {
                                    Text("Sarah P".uppercased()).font(.caption).bold()
                                    Text("Hard, Love it though!")
                                }.padding(.bottom)
                                VStack(alignment: .leading) {
                                    Text("Hersh".uppercased()).font(.caption).bold()
                                    Text("Favorited")
                                }.padding(.bottom)
                                VStack(alignment: .leading) {
                                    Text("Sarah P".uppercased()).font(.caption).bold()
                                    Text("Hard, Love it though!")
                                }.padding(.bottom)
                                VStack(alignment: .leading) {
                                    Text("Hersh".uppercased()).font(.caption).bold()
                                    Text("Favorited")
                                }.padding(.bottom)
                                VStack(alignment: .leading) {
                                    Text("HikingExpert22".uppercased()).font(.caption).bold()
                                    Text("This Hike is a great beginner level hike. You can see elks on the way if you stop on Grand Lake on the way to Pikes Peak. Highly Recommended!").font(.caption)
                                }.padding(.bottom)
                            }
                        }
                        .padding()
                        .background(BlurView(.extraLight))
                        .cornerRadius(20).padding()
                    }
                }
                .offset(y: 620 + self.scrollState)
                .gesture(
                    DragGesture()
                    .onChanged( {
                        (dragValue) in
                        self.scrollState =  dragValue.translation.height
                        self.backgroundOpacity = Double( (-1 * Int(self.scrollState))/Int(self.screenHeight) ).magnitude
                    })
                    .onEnded ({
                        (dragValue) in
                        if dragValue.translation.height < -200   {
                            self.scrollState = -1 * self.screenHeight/1.3
                            self.backgroundOpacity = 0.66
                        }
                        else if ( dragValue.translation.height < -40 )  {
                            self.scrollState = -1 * self.screenHeight/5.3
                            self.backgroundOpacity = 0.33
                        }
                        else  {
                            self.scrollState = 0
                            self.backgroundOpacity = 0
                        }
                    }))
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
