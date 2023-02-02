//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 11/01/23.
//

import SwiftUI

struct NoteReflectionView: View {
    @ObservedObject var reflection: ReflectionNote
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            RoundedRectangle(cornerRadius: 19.0)
                .fill(.white)
                .frame(width: 333, height: 141)
                .shadow(radius: 15, x: 0, y: 0)
                .opacity(0.5)
            
            VStack(alignment: .leading, spacing: 15){
                if let date = reflection.date, let notes = reflection.notes{
                    Text(dateToString(date: date)).font(.system(size: 16, weight: .bold))
                        .opacity(0.5)
                    Text(notes).font(.system(size: 16, weight: .regular))
                        .frame(width: 250, height: 58)
                }
            }
            .padding()
            
            if let feeling = Feeling(rawValue: reflection.feeling!) {
                Text(emojiFromFeeling(feeling: feeling))
                    .font(.system(size: 60, weight: .regular))
                    .frame(maxWidth: 320, maxHeight: 141, alignment: .bottomTrailing)
            }
        }
//        .swipeActions(edge: .trailing, allowsFullSwipe: false){
//            Button(role: .destructive, action: {
//                addEditVM.delete(reflection: reflection, context: PersistenceManager.shared.container.viewContext)
//            }, label: {
//                Label("Delete",systemImage: "trash")
//            })
//            Button(action: {
//                addEditVM.notes = reflection.notes ?? ""
//                addEditVM.feeling = Feeling(rawValue: reflection.feeling!)!
//                addEditVM.reflection = reflection
//                isEdit.toggle()
//            }, label: {
//                Label("Edit",systemImage: "pencil")
//            })
//                .tint(.yellow)
//        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteReflectionView(reflectionVM: ReflectionViewModel(), reflection: reflection1)
//    }
//}
