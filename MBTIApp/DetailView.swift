//
//  DetailView.swift
//  MBTIApp
//
//  Created by Теона Магай on 22.09.2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var firstLetter: String
    @Binding var secondLetter: String
    @Binding var thirdLetter: String
    @Binding var fourthLetter: String
    @Binding var description: String
    
   
    var body: some View {
        let savedCode = $firstLetter.wrappedValue + $secondLetter.wrappedValue + $thirdLetter.wrappedValue + $fourthLetter.wrappedValue
        
        VStack(spacing: 30){
            Text(savedCode)
                .font(.title)
                .bold()
            Text(description)
        }.padding()

    }
}


#Preview {
    DetailView(firstLetter: .constant("E"), secondLetter: .constant("S"), thirdLetter: .constant("T"), fourthLetter: .constant("P"), description: .constant("Some description"))
}
