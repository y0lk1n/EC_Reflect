//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel = ReflectionViewModel()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color ("bg-color").edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack {
                        Text("Journal")
                            .font(.custom("Nunito-Bold", size: 36))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.top, 40)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Spacer()
                    
                    
                    VStack(alignment: .center, spacing: 30) {
                        
                        if reflectionVM.reflections.isEmpty {
                            EmptyJournalView()
                        } else {
                            List {
                                
                                ForEach(reflectionVM.reflections.reversed()) { reflection in
                                    NavigationLink (destination: ReflectionDetailsView(addEditVM: AddEditViewModel(), reflection: reflection)) {
                                        
                                        NoteReflectionView(reflection: reflection)
                                        
                                    }
                                    .buttonStyle(.plain)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            withAnimation {
                                                reflectionVM.deleteReflection(reflection: reflection)
                                            }
                                        } label: {
                                            
                                            
                                            
                                            Text ("Delete")
                                                .padding(.top, 30)
                                            
                                        }
                                    }
                                }
                                .onDelete(perform: reflectionVM.deleteRefOffset)
                                .listRowBackground(Color("bg-color"))
                            }
                            
                            .listStyle(.plain)
                        }
                        
                    }
                    Spacer()
                
                }
        }

            .onAppear{
                reflectionVM.fetchReflections()
            }

        }

    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}

struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack {
            Text("Journal")
                .font(.custom("Nunito-Bold", size: 36))
                .foregroundColor(colorScheme == .light ? .black : .white)
                .padding(.top, 40)
                .padding(.leading, 20)
            Spacer()
        }
    }
}
