//
//  AddNoteView.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import SwiftUI

struct AddNoteView: View {
    
    @StateObject var vm: PersistenceController
    @Environment(\.presentationMode) private var dismiss
    @State var title: String = ""
    @State var desc: String = ""
    var navTitle: String = "Add Note"
    @State var noteItem: NoteItem? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Add note title", text: $title,axis: .vertical)
                .padding()
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .lineLimit(2)
                .overlay(Color.gray, in: RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
            TextEditor(text: $desc)
                .padding()
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .overlay(Color.gray, in: RoundedRectangle(cornerRadius: 4.0).stroke(lineWidth: 1.0))
            Button(action:{
                if navTitle == "Add Note" {
                    vm.saveNote(title: title, desc: desc)
                }else {
                    vm.updateNote(newTitle: title, newDesc: desc, entity: noteItem)
                }
                dismiss.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            })
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(4.0)
            Spacer()
        }
        .padding()
        .navigationTitle(navTitle)
    }
}

//#Preview {
//    AddNoteView()
//}

extension String {
  func size(font: UIFont, width: CGFloat) -> CGSize {
      let attrString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        let bounds = attrString.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        let size = CGSize(width: bounds.width, height: bounds.height)
        return size
    }
}
