//
//  Airports.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-05-26.
//

import SwiftUI
import STREAK
import MapKit


struct Airports: View {
    static  let allAirportsSorted = Airport.allAirports().sorted { $0.iata < $1.iata }

    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List( searchResults ) { a in
                
                NavigationLink(
                    destination: AirportMap(airport:a)
                ) {
                    VStack(alignment: .leading) {
                        Text(a.iata)
                            .font(.headline)
                        Text("\(a.city), \(a.country)")
                    }
                }
            }
            .navigationTitle("World Airports")
        }
        
        .searchable(text: $searchText)
    }
    
    var searchResults: [Airport] {
        
        if searchText.isEmpty {
            return Airports.allAirportsSorted
            
        } else {
            return Airports.allAirportsSorted.filter { $0.country.range(of:searchText, options:.caseInsensitive) != nil}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Airports()
    }
}

struct AirportMap: View {
    var airport: Airport
    @State var region = MKCoordinateRegion()
    var body: some View {
        VStack (alignment: .leading) {

            Map(coordinateRegion: $region, annotationItems:[airport] ) {
                MapMarker(coordinate: $0.coord)
            }
            Text("\(airport.city), \(airport.country)")
                .font(.headline)

        }
        .navigationTitle(airport.iata)
        .padding()
        
        .onAppear {
            Task {
                print("appear at \(airport.coord)")
                region = MKCoordinateRegion(center:airport.coord, latitudinalMeters:  1_000_000, longitudinalMeters: 1_000_000)
                
                print("region is now \(region)")
            }
        }
    }
}
