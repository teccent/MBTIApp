//
//  DetailView.swift
//  MBTIApp
//
//  Created by Теона Магай on 22.09.2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var url: URL?
    
   
    var body: some View {
        VStack {
            if let url = url {
                WebManager(url: url)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("No URL available")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
    }
}


#Preview {
    DetailView(
        url: .constant(URL(string: "https://www.16personalities.com/intj-personality"))
    )
}
