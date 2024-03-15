//
//  RBTodoListViewModel.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import Foundation

class RBTodoListViewModel: ObservableObject {
    
    @Published var todoItems: [TodoItem] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let itemKey: String = "item_list"
    
    init() {
        initTodoItems()
    }
    
    func updateItem(item: TodoItem) {
        if let index = todoItems.firstIndex(where: { $0.id == item.id}) {
            todoItems[index] = item.update()
        }
    }
    
    func addItem(item: TodoItem) {
        todoItems.append(item)
    }
    
    func deleteItem(at indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(fromIndexSet indexSet: IndexSet, toIndex: Int) {
        todoItems.move(fromOffsets: indexSet, toOffset: toIndex)
    }
    
    
    func initTodoItems() {
        //从本地缓存初始化数据
        guard let encodeData = UserDefaults.standard.data(forKey: itemKey),
           let items = try? JSONDecoder().decode([TodoItem].self, from: encodeData) else {
            return
        }
        todoItems = items
    }
    
    //本地缓存数据
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.setValue(encodeData, forKey: itemKey)
        }
    }
}
