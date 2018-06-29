//
//  AboutAuthorViewController.swift
//  BullsEye
//
//  Created by Pawan on 03/12/17.
//  Copyright © 2017 Pawan. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {
    
    @IBOutlet weak var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "AboutAuthor", withExtension: "html"){
            if let htmlData = try? Data(contentsOf:url){
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
                
            } else {
                print("data not loaded");
            }
        }
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
