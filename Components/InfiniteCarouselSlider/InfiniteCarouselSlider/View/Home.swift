//
//  Home.swift
//  InfiniteCarouselSlider
//
//  Created by 마석우 on 2022/08/04.
//

import SwiftUI

struct Home: View {
    
    @State var tab: [Tab] = [Tab(title: "1training 1"), Tab(title: "2training 2"), Tab(title: "3training 3"), Tab(title: "4training 4"), Tab(title: "5training 5")]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    tab.append(Tab(title: "\(Date())"))
                } label: {
                     Image(systemName: "chevron.left")
                        .font(.body.bold())
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.85)))
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .overlay {
                HStack(spacing: 3) {
                    ForEach(tab.indices) { index in
                        Capsule()
                            .fill(.white.opacity(currentIndex == index ? 1 : 0.55))
                            .frame(width: currentIndex == index ? 10 : 5, height: 5)
                            .animation(.easeInOut, value: currentIndex)
                    }
                }
            }
            .padding()
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("prepare training")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Text("Let's create a \ntraining plan\n for you")
                        .font(.system(size: 38, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.white)
                    
                    InfiniteCarouselView(tabs: $tab, currentIndex: $currentIndex)

                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            HStack {
                Text("Next Step")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Spacer()
                
                Button {
                    
                } label: {
                     Image(systemName: "chevron.left")
                        .font(.body.bold())
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.85)))
                }

            }
            .padding(.top, 25)
            .padding(.horizontal, 30)
            .padding(.bottom, 12)
            .background(Color.blue.opacity(0.35).clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 38)).ignoresSafeArea())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
