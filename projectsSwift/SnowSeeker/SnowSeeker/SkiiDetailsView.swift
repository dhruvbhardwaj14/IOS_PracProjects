//
//  SkiiDetailsView.swift
//  SnowSeeker
//
//  Created by Dhruv Bhardwaj on 24/09/22.
//

import SwiftUI

struct SkiiDetailsView: View {
    let resort:Resort
    var body: some View {
        Group {
                    VStack {
                        Text("Elevation")
                            .font(.caption.bold())
                        Text("\(resort.elevation)m")
                            .font(.title3)
                    }

                    VStack {
                        Text("Snow")
                            .font(.caption.bold())
                        Text("\(resort.snowDepth)cm")
                            .font(.title3)
                    }
                }
                .frame(maxWidth: .infinity)
    }
}

struct SkiiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiiDetailsView(resort:Resort.example)
    }
}
