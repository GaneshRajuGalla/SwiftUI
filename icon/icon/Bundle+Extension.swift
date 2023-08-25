//
//  Bundle+Extension.swift
//  icon
//
//  Created by Ganesh on 25/08/23.
//


import Foundation
import SwiftUI

extension Bundle{
    public var icon: UIImage?{
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last else {return nil}
        return UIImage(named: iconFileName)
    }
}

