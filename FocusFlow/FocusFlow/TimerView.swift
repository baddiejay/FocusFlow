//
//  TimerView.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 11/03/24.
//

import SwiftUI

struct TimerView: View {
    var task: Task
    
    @State var timeRemaining: TimeInterval
    @State var timeNeeded: TimeInterval
    @State var timer: Timer?
    @State var isRUnning: Bool = false
    init(task: Task) {
        self.task = task
        _timeRemaining = State(wrappedValue: task.duration)
        _timeNeeded = State(wrappedValue: task.duration)
    }
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                ZStack{
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundStyle(Color("TaskColor"))
                    Circle()
                        .trim(from: 0, to: CGFloat(1 - (timeRemaining/timeNeeded)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(Color("IconColor"))
                    
                    
                        .rotationEffect(.degrees(-90))
                    Text(formattedTime())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: 500)
                
                HStack {
                    Button {
                        isRUnning.toggle()
                        if isRUnning {
                            startTimer()
                        } else{
                            stopTimer()
                        }
                    } label: {
                        Image(systemName: isRUnning ? "pause.fill" : "play.fill")
                            .foregroundStyle(.foreground)
                            .frame(width: 50, height: 50)
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
            .padding(.horizontal, 30)
            .navigationTitle("Timer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func formattedTime() -> String {
        let minutes = Int (timeRemaining) / 60
        let second = Int (timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    private func startTimer() {
        notificationSetting()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func notificationSetting() {
        let content = UNMutableNotificationContent()
        content.title = "FocusFlow"
        content.subtitle = "Time to check in!"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    private func stopTimer () {
        isRUnning = false
        timer?.invalidate()
    }
}

#Preview {
    TimerView(task: sharedData.tasks[0])
}
