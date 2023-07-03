//
//  ContentView.swift
//  LoveSwipe
//
//  Created by Ganesh on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = ViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack{
            Button {
                
            } label: {
                Image("")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22,height: 22)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .overlay (
                Text("Discover")
                    .font(.title.bold())
            )
            .foregroundColor(.black)
            .padding()
            
            ZStack{
                if let users = viewModel.displayedUser{
                    if users.isEmpty{
                        Text("Come back later can find more matches for you!")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }else{
                        ForEach(users.reversed()) { user in
                            StackCardView(user: user)
                                .environmentObject(viewModel)
                        }
                    }
                }else{
                    ProgressView()
                }
            }
            .padding(.top,30)
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(.gray)
                        .clipShape(Circle())
                }
                
                Button {
                    doSwipe()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(.blue)
                        .clipShape(Circle())
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(.yellow)
                        .clipShape(Circle())
                }
                
                Button {
                    doSwipe(rightSwipe: true)
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(.pink)
                        .clipShape(Circle())
                }

            }
            .padding(.bottom)
            .disabled(viewModel.displayedUser?.isEmpty ?? false)
            .opacity(viewModel.displayedUser?.isEmpty ?? false ? 0.6 : 1)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
    }
    
    func doSwipe(rightSwipe:Bool = false){
        guard let first = viewModel.displayedUser?.first else {
            return
        }
        
        NotificationCenter.default.post(name: Notification.Name("ActionOnButton"), object: nil,userInfo: ["id":first.id,"rightSwipe":rightSwipe])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
