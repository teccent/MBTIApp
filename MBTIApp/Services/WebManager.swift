//
//  WebView.swift
//  MBTIApp
//
//  Created by Теона Магай on 28.10.2024.
//

import SwiftUI
import WebKit

struct WebManager: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
