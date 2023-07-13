//
//  SplashScreen.swift
//  ecommerce_app
//
//  Created by Rakesh on 13/07/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive:Bool = false
    var body: some View {
        VStack{
                       Text("Shopping Apps")
                           .font(.title)
                           .fontWeight(.bold)
                           .foregroundColor(.blue)
                   }
                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(Color.white)
                   .edgesIgnoringSafeArea(.all).onAppear{
                       DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                          // Hide the splash screen after 3 seconds
                           self.isActive = true
                       }
                   }
                   .fullScreenCover(isPresented: $isActive, content: {
                               HomeScreen()
                           })
    
    }

}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
