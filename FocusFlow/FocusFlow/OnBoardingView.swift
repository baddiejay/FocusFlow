//
//  OnBoardingView.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 11/03/24.
//

import SwiftUI

struct OnBoardingView: View {
    var onBoarding: [OnBoarding] = onBoardingData
    
    var body: some View {
      TabView {
        ForEach(onBoarding[0...2]) { item in
          OnBoardingCardView(onBoarding: item)
        } //: LOOP
      } //: TAB
      .tabViewStyle(PageTabViewStyle())
      .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
