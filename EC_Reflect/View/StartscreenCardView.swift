//
//  StartscreenCardView.swift
//  EC_Reflect
//
//  Created by Alexey on 19/01/23.
//

import SwiftUI

struct StartscreenCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var reflectionVM: ReflectionViewModel
    @State private var showingWriteReflectionView: Bool = false
    
    var body: some View {
        ZStack {
          RoundedRectangle(cornerRadius: 15)
                .stroke(colorScheme == .light ? .black : .white)
                
                .frame(width: 360, height: 300)
            
       
            VStack{
                Image("bg")
                    .resizable()
                    .frame(width: 360, height: 135)
                    .offset(y: -2)
                Text("How was your day?")
                
                    .font(.custom("Nunito-Bold", size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .light ? .black : .white)
             
                Text("It's day 4 of reflection. Great job!")
                    .font(.custom("Nunito-Regular", size: 16))
                    .fontWeight(.regular)
                
                    
                    .foregroundColor(colorScheme == .light ? .black : .white)
                   
                Button{
                    showingWriteReflectionView.toggle()
                    print("toggle")
                }label: {
                    ZStack{
                        RoundedRectangle (cornerRadius: 50)
//                            .stroke(colorScheme == .light ? .black : .white)
                               .frame(width: 300, height: 60)
                        HStack (alignment: .center){
                            Text("Daily reflection")
                                .font(.custom("Nunito-Bold", size: 20))
                                .foregroundColor(colorScheme == .light ? .white : .black)
                            Image(systemName: "arrow.right")
                                .foregroundColor(colorScheme == .light ? .white : .black)
                                .fontWeight(.bold)
                            
                        }
                   
                       
                        
                     
                    }
                }
                .fullScreenCover(isPresented: $showingWriteReflectionView, content: { WriteReflectionView(reflectionVM: reflectionVM)
                }
                )

                .padding(.bottom, 15)

                DaysCounterView(reflectionVM: reflectionVM)
    
            

            }
       
        }
    }
}


struct StartscreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        StartscreenCardView(reflectionVM: ReflectionViewModel())
    }
}

