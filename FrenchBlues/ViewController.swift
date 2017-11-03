//
//  ViewController.swift
//  FrenchBlues
//
//  Created by Alexy on 03/11/2017.
//  Copyright © 2017 FrenchBlues. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    




    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
        self.webView.navigationDelegate = self
        webView.bringSubview(toFront: indicator)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "http://www.frenchblues.fr")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: Any) {
        webView.goBack()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    }

}

