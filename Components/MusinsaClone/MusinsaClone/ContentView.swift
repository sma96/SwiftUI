//
//  ContentView.swift
//  MusinsaClone
//
//  Created by 마석우 on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab{
        case home
        case profile
        case search
    }

    init() {
        let itemAppearance = UITabBarItemAppearance()
        let appearance = UITabBarAppearance()
        
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        itemAppearance.selected.iconColor = .white
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.backgroundColor = UIColor.systemFill
        UITabBar.appearance().standardAppearance = appearance
//        UITabBar.appearance().backgroundColor = UIColor.systemFill
    }
    
    var body: some View{
        TabView(selection: $selection){
            SearchBar()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(Tab.search)
            ZStack {
                ScrollView {
                    ForEach(0..<10) { _ in
                        Circle()
                            .frame(width: 300, height: 300)
                            .foregroundColor(.green)
                            .background(.yellow)
                    }
                }
            }
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                .tag(Tab.home)
            Text("profile")
                .tabItem{
                    Label("My", systemImage: "person")
                }
                .tag(Tab.profile)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}
