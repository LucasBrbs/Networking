//
//  ScrollView.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 09/08/22.
//

import Foundation
import SwiftUI


struct CentralView : View {
    @Binding var showCentralView: Bool
    @State var posts: [NetPost] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(posts.count)")
                ForEach(posts) { post in
                    Text(post.content)
                    
                }
            }
        }
        .task {
            let posts = await API.getAllPosts()
            self.posts = posts
        }
    }
//    @ObservedObject var viewModel: CentralViewModel = CentralViewModel()
//
//    var body: some View {
//        ZStack {
//            if viewModel.netPost.isEmpty {
//
//            } else {
//
//            }
//        }
//    }
    //mudar nome
}
