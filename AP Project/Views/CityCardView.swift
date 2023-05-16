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
                .fontWeight(.heavy)
                .padding(.top)
            Text("Latitude: " + String(city.latitude))
                .bodyText()
            HStack {
                Text("Urban\nPopulation:\n" + String(city.populationUrban))
                    .bodyText()
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 20)
                Text("Proper\nPopulation:\n" + String(city.populationProper))
                    .bodyText()
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
            }
            
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
