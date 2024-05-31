//
//  NoteItemDetailView.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import SwiftUI

struct NoteItemDetailView: View {
    @State var item : NoteItem
    @StateObject var vm: PersistenceController
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    Text(item.title ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(item.desc ?? "")
                    Spacer()
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,20)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: NavigationLink(destination: AddNoteView(vm: vm, title: item.title ?? "",desc: item.desc ?? "",navTitle: "Edit Note", noteItem: item), label: {
                    Text("Edit")
                }))
        }
    }
}


struct NoteItemModel: Identifiable {
    var id: String?
    var title: String
    var desc: String
    var time: Date?
}
