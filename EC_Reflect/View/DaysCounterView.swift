//
//  DaysCounterView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 31/01/23.
//

import SwiftUI

struct DaysCounterView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    var body: some View {
        
        if (reflectionVM.uniqueDaysСounter == 0) {
            Text("Let's get started!")
                .font(.custom("Nunito-Regular", size: 16))
                .foregroundColor(colorScheme == .light ? .black : .white)
        }
        
        
        if (reflectionVM.uniqueDaysСounter == 1) {
            Text("It's \(reflectionVM.uniqueDaysСounter) day of reflection.")
                .font(.custom("Nunito-Regular", size: 16))
                .foregroundColor(colorScheme == .light ? .black : .white)
              
        }
        
        if (reflectionVM.uniqueDaysСounter > 1) {
            Text("It's \(reflectionVM.uniqueDaysСounter) days of reflection.")
                .font(.custom("Nunito-Regular", size: 16))
                .foregroundColor(colorScheme == .light ? .black : .white)
           
        }
    }
}

struct DaysCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DaysCounterView(reflectionVM: ReflectionViewModel())
    }
}
