//
//  Attractions.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-05-26.
//

import SwiftUI
import STREAK
import MapKit

let attraction = TouristAttraction.EiffelTower
struct Attractions: View {
    @State var region = attraction.region
    @State var selectedAttraction = attraction
    
    
    var body: some View {
        VStack {
            Picker("Attractions", selection:$selectedAttraction ) {
                ForEach(TouristAttraction.allCases, id:\.self){
                    Text($0.name)
                        .tag($0)
                }
            }
            .onChange(of: selectedAttraction) {
                print("Change of attraction to \($0.name)")
                region = $0.region
            }
            Map(coordinateRegion: $region, annotationItems: TouristAttraction.allCases ) { result in
                
                MapAnnotation(coordinate: result.coordinate ) {
                    Button {
                            selectedAttraction = result
                    } label: {
                        Image(systemName: result == selectedAttraction ? "mappin.circle.fill" : "mappin.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width:40, height:40)

                    }
                }
            }
            Text(selectedAttraction.name)
                .font(.headline)
            
            Text("\(selectedAttraction.coordinate.latitude), \(selectedAttraction.coordinate.longitude)")
            
        }
    }
}
struct Attractions_Previews: PreviewProvider {
    static var previews: some View {
        Attractions()
    }
}
