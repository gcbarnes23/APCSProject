import SwiftUI

struct CityCard: View {
    var body: some View {
        VStack {
            Text("Madrid")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top)
                .foregroundColor(Color("AccentColor"))
         
            AsyncImage(
                url: URL(string: "https://www.travelandleisure.com/thmb/bm51vTBcyGJ840aDyLWaIOLqrgQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/madrid-spain-MADRIDTG0621-b2347a98186a4281a0874992b213ade0.jpg"),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 200)
                        .scaledToFill()
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text("Province: Madrid")
                .bodyText()
            Text("Latitude: 40.4167")
                .bodyText()
            Text("Urban Population: 6026000")
                .bodyText()
            Text("Madrid Proper Population: 3266126")
                .bodyText()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct CityCard_Previews: PreviewProvider {
    static var previews: some View {
        CityCard()
    }
}
