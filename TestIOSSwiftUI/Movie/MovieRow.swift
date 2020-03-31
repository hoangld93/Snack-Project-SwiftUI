import URLImage
import SwiftUI
import Nuke

struct MovieRow : View {
    var movie: Movie
    var body: some View {
        HStack {
            //            URLImage(URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path)")!, delay: 0.25)
            //                .frame(width: 120, height: 160)
            //            URLImage(urlImage), placeholder: { _ in
            //                Image(systemName: "circle")             // Use different image for the placeholder
            //                    .resizable()                        // Make it resizable
            //                    .frame(width: 150.0, height: 150.0) // Set frame to 150x150
            //            })
            
            
            RemoteImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path)")!)
                .frame(width: 155, height: 155)
                .cornerRadius(5)

            
            VStack {
                HStack {
                    Text(movie.title)
                        .foregroundColor(Color.blue)
                        .lineLimit(nil)
                    Spacer() // help to align the title in the left
                }
                HStack {
                    Text(movie.release_date).foregroundColor(Color.gray)
                    Spacer()
                    Text("Rate: \(movie.vote_average)")
                }
                Spacer()
            }
        }.padding()
    }
}
