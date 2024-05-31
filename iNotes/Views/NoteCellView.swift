//
//  NoteCellView.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import SwiftUI

struct NoteCellView: View {
    @StateObject var item : NoteItem
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title ?? "")
                    .lineLimit(1)
                    .font(.subheadline)
                HStack{
                    Text(item.time ?? Date(),style: .date)
                    Text(item.time ?? Date(),style: .time)
                }
                .foregroundColor(.gray)
                .font(.caption)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

