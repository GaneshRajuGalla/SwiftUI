//
//  ContentView.swift
//  SystemSounds
//
//  Created by Ganesh on 21/08/23.
//

import SwiftUI
import AVKit

struct SystemSoundsView: View {
    
    let systemSounds:[String] = ["1000","1001","1002","1003","1004","1005","1006","1007","1008","1009","1010","1011","1012","1013","1014","1015","1016","1020","1021","1022","1023","1024","1025","1026","1027","1028","1029","1030","1031","1032","1033","1034","1035","1036","1050","1051","1052","1053","1054","1055","1057","1070","1071","1072","1073","1074","1075","1100","1101","1102","1103","1104","1105","1106","1107","1108","1109","1110","1111","1112","1113","1114","1115","1116","1117","1118","1150","1151","1152","1153","1154","1200","1201","1202","1203","1204","1205","1206","1207","1208","1209","1210","1211","1254","1255","1256","1257","1258","1259","1300","1301","1302","1303","1304","1305","1306","1307","1308","1309","1310","1311","1312","1313","1314","1315","1320","1321","1322","1323","1324","1325","1326","1327","1328","1329","1330","1331","1332","1333","1334","1335","1336","1350","1351","4095"]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 10){
                    ForEach(0..<systemSounds.count) { index in
                        Button {
                            if let sound = Int(systemSounds[index]){
                                AudioServicesPlaySystemSound(SystemSoundID(sound))
                            }
                        } label: {
                            Label("\(systemSounds[index])", systemImage: "speaker.wave.1.fill")
                        }
                        .withCustomButtonStyle()
                    }
                }
            }
            .navigationTitle("System Sounds")
            .padding(.horizontal)
        }
    }
}



struct CustomButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1)).gradient.opacity(0.7))
            .cornerRadius(10)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}


extension View{
    func withCustomButtonStyle() -> some View{
        buttonStyle(CustomButtonStyle())
    }
}
