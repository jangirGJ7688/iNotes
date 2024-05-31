//
//  Persistence.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import CoreData

class PersistenceController: ObservableObject {
    
    private let container: NSPersistentContainer
    
    @Published var noteItems: [NoteItem] = []

    init() {
        container = NSPersistentContainer(name: "iNotes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                debugPrint("Unresolved error \(error), \(error.userInfo)")
            }else {
                debugPrint("Ganpat loading core data is successful")
            }
        })
        fetchNotes()
    }
    
    private func fetchNotes() {
        let request = NSFetchRequest<NoteItem>(entityName: "NoteItem")
        request.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        do {
            self.noteItems = try container.viewContext.fetch(request)
        } catch let error {
            debugPrint("Ganpat error in fetching notes \(error.localizedDescription)")
        }
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchNotes()
        } catch let error {
            debugPrint("Ganpat Error in saving item with error \(error.localizedDescription)")
        }
    }
    
    func saveNote(title: String, desc: String){
        if title.isEmpty || desc.isEmpty {
            return
        }
        let newNote = NoteItem(context: container.viewContext)
        newNote.title = title
        newNote.desc = desc
        newNote.time = Date()
        saveData()
    }
    
    func updateNote(newTitle: String, newDesc: String, entity: NoteItem?){
        if newDesc.isEmpty || newTitle.isEmpty {
            return
        }
        if let noteItem = entity {
            noteItem.title = newTitle
            noteItem.desc = newDesc
            noteItem.time = Date()
            saveData()
        }
    }
    
    func deleteNote(indexset: IndexSet) {
        guard let index = indexset.first else {
            return
        }
        let entity = noteItems[index]
        container.viewContext.delete(entity)
        saveData()
    }
}
