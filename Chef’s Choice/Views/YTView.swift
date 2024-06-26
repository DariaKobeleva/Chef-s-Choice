//
//  YTView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 21.06.2024.
//

import SwiftUI
import WebKit
import Kingfisher

struct YTView: View {
    @StateObject private var networkManager = NetworkManager()
    let videoURL: String
    let imageURL: URL
    
    var body: some View {
        if let videoID = networkManager.extractYouTubeVideoID(from: videoURL) {
            Video(videoID: videoID)
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                .shadow(radius: 5)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        } else {
       //TODO: Доделать
            CustomKFImageView(imageURL: imageURL)
            //            KFImage(URL(string: imageURL))
            //                .placeholder {
            //                    ProgressView()
            //                    Image("defaultImage")
            //                        .resizable()
            //                        .clipped()
            //                        .cornerRadius(30)
            //                        .aspectRatio(contentMode: .fit)
            //                }
            //                .cacheOriginalImage()
            //                .cacheMemoryOnly()
            //                .fade(duration: 0.15)
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            //                .frame(width: UIScreen.main.bounds.width - 40)
            //                .shadow(radius: 5)
            
        }
    }
}

struct Video: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let embedURL = URL(string: "https://www.youtube.com/embed/\(videoID)") {
            uiView.load(URLRequest(url: embedURL))
            uiView.scrollView.isScrollEnabled = false
        }
    }
}

#Preview {
    YTView(videoURL: "", imageURL: URL(string:"https://www.themealdb.com/images/media/meals/z0ageb1583189517.jpg")!)
}


