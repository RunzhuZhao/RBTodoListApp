//
//  TodoItemRowView.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import SwiftUI

struct RBTodoItemRowView: View {
    var todoItem: TodoItem
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
                .imageScale(.large)
                .foregroundStyle( todoItem.isCompleted ? .green : .red)
                .padding(.trailing, 8)
            Text(todoItem.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

#Preview {
    RBTodoItemRowView(todoItem: TodoItem(title: "精通SwiftUI开发"))
}
