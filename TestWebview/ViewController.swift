//
//  ViewController.swift
//  TestWebview
//
//  Created by 杨静伟 on 2020/1/6.
//  Copyright © 2020 firstleap. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

  // MARK: - lazy load
  lazy private var webView: WKWebView = {
    let configuration = WKWebViewConfiguration()
    if #available(iOS 10.0, *) {
      configuration.mediaTypesRequiringUserActionForPlayback = []
    } else {
      configuration.mediaPlaybackRequiresUserAction = false
    }
    configuration.allowsInlineMediaPlayback = true
    let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 414, height: 800), configuration: configuration)
    webView.sizeToFit()
    webView.isOpaque = false //这个属性必须设置为false，否则在网络不好的情况下app推出后台，再次进来此页面会白屏
    webView.autoresizesSubviews = true
    //    webView.contentMode = .scaleToFill
    webView.scrollView.bounces = false
    webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    webView.scrollView.contentSize = CGSize(width: 414, height: 800)
    
    return webView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(webView)
    guard let url = URL(string: "https://online.firstleap.cn/EndOfTerm_audio_test/app/index.html") else { return }
    webView.load(URLRequest(url: url))
    
  }


}

