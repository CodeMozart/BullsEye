//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Minghe on 10/20/15.
//  Copyright © 2015 Minghor. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            if let htmlData = NSData(contentsOfFile: htmlFile) {
                let baseURL = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    
    
    
    @IBAction func close(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
