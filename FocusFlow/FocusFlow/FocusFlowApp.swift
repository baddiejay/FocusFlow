//
//  FocusFlowApp.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 07/03/24.
//

import SwiftUI
import UserNotifications

@main
struct FocusFlowApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
              OnBoardingView()
            } else {
              TaskView()
                    .onAppear {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error {
                                print(error.localizedDescription)
                            }
                        }
                    }
            }
        }
    }
}
