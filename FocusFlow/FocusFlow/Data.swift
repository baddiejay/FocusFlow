//
//  Data.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 07/03/24.
//

import SwiftUI
import Observation

// Helper function to create Date instances from components
func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.timeZone = TimeZone.current
    //DateComponents to specify the components and then Calendar to create the date. The Calendar gives the Date context. 
    let calendar = Calendar.current
    return calendar.date(from: components)!
}

let onBoardingData: [OnBoarding] = [
    OnBoarding(
      title: "Welcome!",
      titleColor: Color("TaskColor"),
      headline: "FocusFlow is here to help you organize your tasks and stay focused using Pomodoro technique",
      image: "OnBoarding1",
      backgroundColor: Color("IconColor")
    ),
    OnBoarding(
      title: "Pomodoro Technique",
      titleColor: Color("IconColor"),
      headline: "20 minutes of focused work, 5 minutes of relax and reward yourself with a high-five... because why not?",
      image: "OnBoarding2",
      backgroundColor: Color("TaskColor")
    ),
    OnBoarding(
      title: "Let's begin!",
      titleColor: Color("TaskColor"),
      headline: "Tell us what you want to do and for how long, FocusFlow will do the magic for you",
      image: "OnBoarding3",
      backgroundColor: Color("IconColor")
    )
]

@Observable
class SharedData {
    var tasks = [
        Task(name: "Idea Generation", when: createDate(year: 2024, month: 03, day: 14, hour: 10, minute: 00), duration: 1200, howLong: 20, taskColor: Color("TaskColor"), toDoList: [
            Todo(title:"Brainstorm potential app concepts"),
            Todo(title:"Consider problems or needs that the app could address"),
            Todo(title:"Think about target audiences and demographics")
        ]),
        Task(name: "BREAK!", when: createDate(year: 2024, month: 03, day: 14, hour: 10, minute: 20), duration: 300, howLong: 5, taskColor: Color("BreakColor"), toDoList: [])
    ]
}

var sharedData = SharedData()

