//
//  ContentView.swift
//  icon
//
//  Created by Ganesh on 25/08/23.
//

import SwiftUI

struct IconView: View {
    let appIcons:[String] = ["AppIcon 1","AppIcon 2"]
    var body: some View {
        List{
            ForEach(appIcons,id: \.self) { name in
                Button {
                    UIApplication.shared.setAlternateIconName(name)
                } label: {
                    Text(name)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

extension Bundle{
    public var icon: UIImage?{
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last else {return nil}
        return UIImage(named: iconFileName)
    }
}



