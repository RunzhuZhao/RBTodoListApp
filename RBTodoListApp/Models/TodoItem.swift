//
//  TodoItem.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import Foundation

//Identifiable: 唯一性协议，能标记对象唯一性
//Codable: 支持编解码协议  =》public typealias Codable = Decodable & Encodable
struct TodoItem: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    //更新Item完成状态
    func update() -> TodoItem {
        return TodoItem(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
