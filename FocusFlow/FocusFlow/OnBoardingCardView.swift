//
//  OnBoardingCardView.swift
//  FocusFlow
//
//  Created by Chiara Coppola on 11/03/24.
//

import SwiftUI

struct OnBoardingCardView: View {
    var onBoarding: OnBoarding
    
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
      ZStack {
        VStack(spacing: 20) {
            Image(onBoarding.image)
            .resizable()
            .scaledToFit()
            .scaleEffect(isAnimating ? 1.0 : 0.6)
          
            Text(onBoarding.title)
            .foregroundColor(onBoarding.titleColor)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          
            Text(onBoarding.headline)
                .font(.title2)
                .fontWeight(.thin)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(maxWidth: 480)
            .padding(20)
          
          // BUTTON: START
          StartButtonView()
        } //: VSTACK
      } //: ZSTACK
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimating = true
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(onBoarding.backgroundColor)
      .cornerRadius(20)
      .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingCardView(onBoarding: onBoardingData[0])
}
