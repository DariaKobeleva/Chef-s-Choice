//
//  YTView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 21.06.2024.
//

import SwiftUI
import WebKit

struct YTView: View {
    @StateObject private var networkManager = NetworkManager()
    let videoURL: String
    
    var body: some View {
        if let videoID = networkManager.extractYouTubeVideoID(from: videoURL) {
            Video(videoID: videoID)
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                .shadow(radius: 5)
        } else {
            Text("Invalid YouTube URL")
                .foregroundColor(.red)
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
    YTView(videoURL: "https://www.youtube.com/watch?v=oJvbsVSblfk")
}


