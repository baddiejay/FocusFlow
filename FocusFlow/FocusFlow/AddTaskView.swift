//
//  AddTaskView.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 07/03/24.
//

import SwiftUI

struct AddTaskView: View {
    @State var name: String = ""
    @State private var when_field = Date.now
    @State private var date = Date()
    @State private var hours: Int = 1
    @State private var minutes: Int = 0
    var myData = sharedData
    @Environment(\.dismiss) var dismiss
    
    //@State var ingredientNames = [""] /// array of ingredients
    @State var ingredientNames: [Todo] = []
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Insert the task name", text: $name)
                }
                Section("When") {
                    DatePicker(selection: $when_field, label: { Text("Start date") })
                }
                Section("How Long") {
                    HStack(spacing: 0) {
                        ZStack {
                            Picker(selection: $hours, label: Text("Picker")) {
                                ForEach((1...24), id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel)
                            .clipShape(.rect.offset(x: -16))
                            .padding(.trailing, -16)
                            Text("hours")
                                .padding(.leading, 95.0)
                        }
                        
                        ZStack {
                            Picker(selection: $minutes, label: Text("Picker")) {
                                ForEach((0...60), id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel)
                            .clipShape(.rect.offset(x: 16))
                            .padding(.leading, -16)
                            Text("min")
                                .padding(.leading, 55.0)
                        }
                    }
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addTask(name: name, when: when_field, hours: hours, minutes: minutes)
                        dismiss()
                    }){
                        Text("Add")
                    }
                }
            }
        }
    }
    
    func addTask(name: String, when: Date, hours: Int, minutes: Int){
        var trueWhen = when
        //Converting hours in minutes
        let totalMinutes = (hours * 60) + minutes
        //Splitting the total minutes in slots of 20 minutes
        let numberOfTasks = totalMinutes / 20
        for _ in 1...numberOfTasks {
            let newTaskWork = Task(name: name, when: trueWhen, duration: 1200, howLong: totalMinutes, taskColor: Color("TaskColor"), toDoList: [])
            myData.tasks.append(newTaskWork)
            trueWhen = trueWhen.addingTimeInterval(1200)
            let newTaskBreak = Task(name: "Break!", when: trueWhen, duration: 300, howLong: totalMinutes, taskColor: Color("BreakColor"), toDoList: [])
            myData.tasks.append(newTaskBreak)
            trueWhen = trueWhen.addingTimeInterval(300)
        }
    }
}

#Preview {
    AddTaskView()
}
