//
//  ContentView.swift
//  H4X0R News
//
//  Created by Yuancheng Zhang on 2021/5/13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetwrokManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
