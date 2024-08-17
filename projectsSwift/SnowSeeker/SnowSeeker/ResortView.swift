//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Dhruv Bhardwaj on 24/09/22.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    let resort:Resort
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        
                            Image(decorative: resort.id)
                                .resizable()
                                .scaledToFit()
                        Text("@"+resort.imageCredit)
                        .frame(maxWidth:.infinity,alignment: .center)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        HStack {
                            if sizeClass == .compact && typeSize > .large {
                                VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                                VStack(spacing: 10) { SkiiDetailsView(resort: resort) }
                            } else {
                                ResortDetailsView(resort: resort)
                                SkiiDetailsView(resort: resort)
                            }
                        }
                        .padding(.vertical)
                        .background(Color.secondary.opacity(0.1))
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                        Group {
                            
                            Text(resort.description)
                                .padding(.vertical)

                            Text("Facilities")
                                .font(.headline)

                            HStack {
                                ForEach(resort.facilityTypes) { facility in
                                    Button {
                                        selectedFacility = facility
                                        showingFacility = true
                                    } label: {
                                        facility.icon
                                            .font(.title)
                                    }
                                }
                            }
//                            .padding(.vertical)
//                            Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
//                                if favorites.contains(resort) {
//                                    favorites.remove(resort)
//                                } else {
//                                    favorites.add(resort)
//                                }
//                            }
//                            .buttonStyle(.borderedProminent)
//                            .padding()
                            
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("\(resort.name), \(resort.country)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button{
                        if favorites.contains(resort) {
                            favorites.remove(resort)
                        } else {
                            favorites.add(resort)
                        }
                    }label: {
                        Image(systemName: favorites.contains(resort) ?  "heart.fill":"heart")
                            .foregroundColor(favorites.contains(resort) ? .red : .primary)
                    }
//                        .buttonStyle(.borderedProminent)
                    .foregroundColor(.secondary)
                    .padding()

                }
                .alert(selectedFacility?.name ?? "More Information", isPresented: $showingFacility, presenting: selectedFacility){_ in
                }message:{ facility in
                    Text(facility.description)
                }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
