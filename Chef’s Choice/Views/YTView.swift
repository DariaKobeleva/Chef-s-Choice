//
//  YTView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 21.06.2024.
//

import SwiftUI
import WebKit

struct YTView: View {
    let videoURL: String
    
    var body: some View {
        if let videoID = extractYouTubeVideoID(from: videoURL) {
            Video(videoID: videoID)
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                .shadow(radius: 5)
        } else {
            Text("Invalid YouTube URL")
                .foregroundColor(.red)
        }
    }
    
    func extractYouTubeVideoID(from url: String) -> String? {
        let pattern = "(?<=v=|\\/v\\/|be\\/|embed\\/|\\/\\?v=|\\&v=|youtu\\.be\\/|watch\\?v%3D|\\/e\\/|\\/\\?vi=|\\&vi=)([a-zA-Z0-9_-]{11})"

        if let range = url.range(of: pattern, options: .regularExpression) {
            return String(url[range])
        }
        return nil
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


