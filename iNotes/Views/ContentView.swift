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
    @State var query: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                if vm.noteItems.isEmpty {
                    VStack {
                        Image("noimage")
                            .resizable()
                            .frame(width: 300,height: 400)
                        Text("No Note to show")
                            .font(.title)
                    }
                }else {
                    VStack {
                        List {
                            ForEach(query.isEmpty ? vm.noteItems : vm.noteItems.filter { $0.title!.contains(query)}){ item in
                                NavigationLink(destination: NoteItemDetailView(item: item, vm: vm)) {
                                    NoteCellView(item: item)
                                }
                                .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: vm.deleteNote)
                        }
                        .listStyle(.insetGrouped)
                        .listRowSpacing(10)
                    }
                    .background(Color.gray.opacity(0.1))
                    .searchable(text: $query)
                }
            }
            .navigationBarItems(trailing: Button(action: {}, label: {
                NavigationLink(destination: AddNoteView(vm: vm)) {
                    Text("Add Note")
                }
            }))
            .navigationTitle("iNotes")
        }
    }
}

#Preview {
    ContentView()
}
