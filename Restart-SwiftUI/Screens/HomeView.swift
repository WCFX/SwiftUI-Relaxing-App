//
//  HomeView.swift
//  Restart-SwiftUI
//
//  Created by WAGNER GOULART on 04/05/22.
//

import SwiftUI

struct HomeView: View {

  // MARK: - Properties

  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @State private var isAnimating: Bool = false

  // MARK: - Body

    var body: some View {
      ZStack {
        Color("ColorGray")
          .ignoresSafeArea(.all, edges: .all)
          .opacity(0.8)

        VStack(spacing: 80) {
          Spacer()

          ZStack {
            CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2, ShapeLineWidth: 80, ShapeWidth: 300, ShapeHeight: 300)
            CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2, ShapeLineWidth: 80, ShapeWidth: 300, ShapeHeight: 250)
            Image("character-2")
              .resizable()
              .scaledToFit()
              .padding()
              .offset(y: isAnimating ? 35 : -35)
              .animation(
                Animation
                  .easeInOut(duration: 4)
                  .repeatForever(),
                value: isAnimating
              )
          }
          VStack(spacing: 40){
            VStack(spacing: 20){
              Text("O tempo que leva à maestria \ndepende da intensidade do nosso foco")
                .font(.system(size: 22))
                .fontWeight(.light)
                .opacity(0.6)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
            }
          }
          Spacer()
          Button(action: {
            withAnimation {
              playSound(sound: "success", type: "m4a")
              isOnboardingViewActive = true  
            }
          }) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
              .imageScale(.large)
            Text("Restart")
              .font(.system(.title, design: .rounded))
              .fontWeight(.bold)
          }
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.capsule)
          .controlSize(.large)
        } //MARK: - VSTACK
        .onAppear(perform: {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            isAnimating = true
          })
        })
      } //MARK: - ZSTACK
    }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
