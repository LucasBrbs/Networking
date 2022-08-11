//
//  ScrollView.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 09/08/22.
//

import Foundation
import SwiftUI


struct CentralView : View {
    
    @State var posts: [NetPost] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(posts.count)")
                ForEach(posts) { post in
                    Text(post.content)
                }
            }.navigationBarTitle("title")
        }
        .task {
            let posts = await API.getAllPosts()
            self.posts = posts
        }
    }
}
