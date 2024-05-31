//
//  ContentView.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var vm = PersistenceController()

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.noteItems){ item in
                    NavigationLink(destination: NoteItemDetailView(item: item, vm: vm)) {
                        NoteCellView(item: item)
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: vm.deleteNote)
            }
            .listStyle(.insetGrouped)
            .listRowSpacing(10)
            .navigationBarItems(trailing: Button(action: {}, label: {
                NavigationLink(destination: AddNoteView(vm: vm)) {
                    Text("Add Note")
                }
            }))
            .navigationTitle("iNotes")
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    ContentView()
}
