//
//  StartScreen.swift
//  EC_Reflect
//
//  Created by Alexey on 12/01/23.
//

import SwiftUI

struct StartScreen: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    @ObservedObject var quoteVM: QuoteViewModel

    var title = "Today"

    var body: some View {
            VStack (alignment: .center) {
                            VStack (alignment: .leading) {
                                Text("Hello, Irina!")
                                    .font(.system(size: 20).bold())
                                    .fontWeight(.regular)
                
                                    Text("Today")
                                        .font(.system(size: 40).bold())
                                        .fontWeight(.bold)
                
                                Text(dateToString(date: Date()))
                                        .font(.system(size: 20).bold())
                                        .fontWeight(.regular)             
                            }
                            .padding(.top, 10)
                StartscreenCardView(reflectionVM: reflectionVM)
                .padding(.top, 20)
               
                
                QuoteView(quoteVM: QuoteViewModel())
            }
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
    
       ContentView()
    }
}
