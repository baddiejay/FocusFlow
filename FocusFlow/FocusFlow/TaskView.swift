//
//  TaskView.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 07/03/24.
//

import SwiftUI

struct TaskView: View {
    var myData = sharedData
    @State var isModalShowed: Bool = false
    @State private var date = Date()
    var filteredTasks: [Task] {
        
        myData.tasks.filter({
            let taskDate = Calendar.current.startOfDay(for: $0.when)
            let selected = Calendar.current.startOfDay(for: date)
            return taskDate == selected
        })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack() {
                    ForEach(filteredTasks) {
                        task in
                        NavigationLink(destination: TimerView(task: task)) {
                            HStack {
                                Text(task.when.formatted(date: .omitted, time: .shortened))
                                    .padding(.trailing, 10.0)
                                ZStack(alignment: .bottomLeading) {
                                    Rectangle().fill()
                                        .foregroundColor(task.taskColor)
                                        Text(task.name).font(.title).bold()
                                    .foregroundStyle(Color.white)
                                    .padding()
                                }// END ZSTACK
                                .cornerRadius(15)
                            }
                        }
                    }
                }
            }//End ScrollView
            .navigationTitle("Tasks of the day")
            .padding()
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "calendar.badge.clock")
                            .overlay{
                                DatePicker("", selection: $date, displayedComponents: .date)
                                    .blendMode(.destinationOver)
                            }
                        Button(action: {
                            isModalShowed.toggle()
                        }){
                            Image(systemName: "plus")
                        }.sheet(isPresented: $isModalShowed ) {
                            AddTaskView()
                        }
                    }
                }
            })
        }//End NavigationStack
    }
}

#Preview {
    TaskView()
}
