//
//  Home.swift
//  StaggeredGrid
//
//  Created by Ganesh on 14/05/23.
//

import SwiftUI

struct Home: View {
    
    // MARK: - Properties
    @State private var posts: [Post] = {
        var generatedPosts = [Post]()
        let repetitions = 10
        let totalElements = 25
        
        for _ in 1...repetitions {
            for i in 1...totalElements {
                let imageURL = "image\(i)"
                let post = Post(imageURL: imageURL)
                generatedPosts.append(post)
            }
        }
        
        return generatedPosts
    }()

    @State private var column:Int = 2
    @Namespace var animation
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            StaggeredGrid(list: posts, columns: column,content: { post in
                PostCard(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
                    .onAppear{
                        print(post.imageURL)
                    }
            })
            .padding(.horizontal)
            .navigationTitle("Staggered Grid")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        column += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        column = max(column - 1,1)
                    } label: {
                        Image(systemName: "minus")
                    }

                }
            }
            .animation(.easeInOut, value: column)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct PostCard: View {
    var post: Post
    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio( contentMode: .fit)
            .cornerRadius(10)
    }
}

