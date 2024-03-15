//
//  Task.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 07/03/24.
//

import SwiftUI

//represents a task item
struct Task: Identifiable{
    let id = UUID()
    var name: String
    var when: Date = Date.now
    var duration: TimeInterval
    //Integer interval for the minutes time span
    var howLong: Int
    var taskColor: Color
    var toDoList: [Todo]
}

//represents a todo item
struct Todo: Identifiable{
    let id = UUID()
    var title: String
}
