import SwiftUI

struct CityCard: View {
    @State var city: City
    
    var body: some View {
        VStack {
            Text(city.city)
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top)
                .foregroundColor(Color("AccentColor"))
         
            AsyncImage(
                url: URL(string: city.imageURL),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 200)
                        .cornerRadius(15)
                        .scaledToFill()
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text("Province: " + city.province)
                .bodyText()
            Text("Latitude: " + String(city.latitude))
                .bodyText()
            Text("Urban Population: " + String(city.populationUrban))
                .bodyText()
            Text("Proper Population: " + String(city.populationProper))
                .bodyText()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
    }
}

//struct CityCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CityCard()
//    }
//}
