//
//  ContentView.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import SwiftUI

struct RBTodoListView: View {
    
    @EnvironmentObject var viewModel: RBTodoListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.todoItems.isEmpty {
                RBNoItemsView()
            } else {
                List {
                    ForEach(viewModel.todoItems) { item in
                        RBTodoItemRowView(todoItem: item)
                            .onTapGesture {
                                viewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteItem(at: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        viewModel.moveItem(fromIndexSet: indices, toIndex: newOffset)
                    })
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List")
        .toolbar {
            if !viewModel.todoItems.isEmpty {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: RBAddItemView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        RBTodoListView()
    }
    .environmentObject(RBTodoListViewModel())
}
