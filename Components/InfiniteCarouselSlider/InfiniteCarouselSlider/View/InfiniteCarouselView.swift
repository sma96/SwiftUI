//
//  InfiniteCarouselView.swift
//  InfiniteCarouselSlider
//
//  Created by 마석우 on 2022/08/04.
//

import SwiftUI

struct InfiniteCarouselView: View {
    
    @Binding var tabs: [Tab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    @State var offset: CGFloat = 0
    @State var tempTabs:[Tab] = []
    
    var body: some View {
        TabView(selection: $fakeIndex) {
            ForEach(tempTabs) { tab in
                VStack(spacing: 18) {
                    
                    Spacer()
                    
                    Text("Your Condition")
                        .font(.title3.bold())
                        .foregroundColor(.gray)
                    
                    Text(tab.title)
                        .font(.largeTitle.bold())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 75, weight: .light))
                        .foregroundColor(.green)
                        .padding(.bottom)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .clipShape(CustomCardShape())
                .cornerRadius(30)
                .padding(.horizontal, 50)
                .overlay {
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: offsetKey.self, value: proxy.frame(in: .global).minX)
                    }
                }
                .onPreferenceChange(offsetKey.self) { offset in
                    
                    self.offset = offset
                }
                .tag(getIndex(tab: tab))
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 350)
        .padding(.top, 20)
        .onChange(of: offset) { newValue in
            
            if fakeIndex == 0 && offset == 0 {
                fakeIndex = tempTabs.count - 2
            }
            
            if fakeIndex == tempTabs.count - 1 && offset == 0 {
                fakeIndex = 1
            }
        }
        .onAppear {
            
            tempTabs = tabs
            guard var first = tempTabs.first else {
                return
            }

            guard var last = tempTabs.last else {
                return
            }
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            tempTabs.append(first)
            tempTabs.insert(last, at: 0)
            fakeIndex = 1
        }
        
        .onChange(of: tabs) { newValue in
            tempTabs = tabs
            
            guard var first = tempTabs.first else {
                return
            }

            guard var last = tempTabs.last else {
                return
            }
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            tempTabs.append(first)
            tempTabs.insert(last, at: 0)
            fakeIndex = 1
        }
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex - 1
        }
    }
    
    func getIndex(tab: Tab) -> Int {
        let index = tempTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct offsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
