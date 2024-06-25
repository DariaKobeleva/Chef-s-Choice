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
    let imageURL: String
    
    var body: some View {
        VStack {
            if let videoID = networkManager.extractYouTubeVideoID(from: videoURL) {
                Video(videoID: videoID)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .shadow(radius: 5)
            } else {
                KFImage(URL(string: imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .shadow(radius: 5)
            }
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
    YTView(videoURL: "", imageURL: "https://www.themealdb.com/images/media/meals/z0ageb1583189517.jpg")
}


