//
//  ViewController.swift
//  JunctionWakeUp
//
//  Created by Goran Vuksic on 31/03/2019.
//  Copyright © 2019 Goran Vuksic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var checkTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        restedDataWhenDone()

        // set up timer
        self.checkTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(checkIsThereNewData), userInfo: nil, repeats: true)

    }

    @objc func checkIsThereNewData() {
        let headers = [
            "Cache-Control": "no-cache"
        ]
        
        // check data endpoint
        let request = NSMutableURLRequest(url: NSURL(string: "https://dv6bjerrtd.execute-api.us-east-1.amazonaws.com/dev/check")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                // there was error
                print(error ?? "")
            } else {
                let contents = String(data: data!, encoding: .ascii)
                if (contents!.contains("0"))  {
                    // dummy id is in, no action needed
                } else {
                    // invoke hub via bluetooth
                    self.moveHammer()
                    self.restedDataWhenDone()
                }
            }
        })
        
        dataTask.resume()
    }
    
    func restedDataWhenDone() {
        let headers = [
            "Cache-Control": "no-cache"
        ]
        
        // complete endpoint
        let request = NSMutableURLRequest(url: NSURL(string: "https://dv6bjerrtd.execute-api.us-east-1.amazonaws.com/dev/complete")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                // there was error
                print(error ?? "")
            }
        })

        dataTask.resume()
    }
    
    func moveHammer() {
        // move motor forward and backward
        
        // code to control hub: https://github.com/bricklife/BoostRemote
        // code is excluded from this project because of licence
        // LEGO and BOOST are Trademarks from The LEGO Company
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.checkTimer.invalidate()
    }

}

