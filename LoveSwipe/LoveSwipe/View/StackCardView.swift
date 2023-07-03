//
//  StackCardView.swift
//  LoveSwipe
//
//  Created by Ganesh on 30/05/23.
//

import SwiftUI

struct StackCardView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel:ViewModel
    var user:User
    @State var offset:CGFloat = 0
    @GestureState var isDragging:Bool = false
    @State var endSwipe:Bool = false
    
    // MARK: - Body
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let index = CGFloat(viewModel.getIndex(user: user))
            let topOffset = (index <= 2 ? index : 2) * 15
            ZStack{
                Image(user.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - topOffset,height: size.height)
                    .cornerRadius(15)
                    .offset(y: -topOffset)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
        }
        .offset(x:offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0,to: endSwipe ? 0 : 1))
        .gesture(
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    let translation = value.translation.width
                    offset = (isDragging ? translation : .zero)
                })
                .onEnded({ value in
                    let width = getRect().width
                    let translation = value.translation.width
                    let checkingStatus = (translation > 0 ? translation : -translation)
                    
                    withAnimation {
                        if checkingStatus > (width / 2){
                            offset = (translation > 0 ? width : -width) * 2
                            endSwipeAction()
                            if translation > 0{
                                rightSwipe()
                            }else{
                                leftSwipe()
                            }
                        }else{
                            offset = .zero
                        }
                    }
                })
        )
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ActionOnButton"),object: nil)){ data in
            guard let info = data.userInfo else{
                return
            }
            let id = info["id"] as? String ?? ""
            let rightSwipe = info["rightSwipe"] as? Bool ?? false
            let width = getRect().width - 50
            if user.id  == id{
                withAnimation {
                    offset = (rightSwipe ? width : -width) * 2
                    endSwipeAction()
                    if rightSwipe{
                        self.rightSwipe()
                    }else{
                        leftSwipe()
                    }
                }
            }
        }
    }
    
    func getRotation(angle:Double) -> Double{
        let rotation = (offset / (getRect().width - 50)) * angle
        return rotation
    }
    
    func endSwipeAction(){
        withAnimation(.none){endSwipe = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            if let _ = viewModel.displayedUser?.first{
                let _ = withAnimation {
                    viewModel.displayedUser?.removeFirst()
                }
            }
        }
    }
    
    func rightSwipe(){
        print("right swipe")
    }
    
    func leftSwipe(){
        print("left swipe")
    }
}

struct StackCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
