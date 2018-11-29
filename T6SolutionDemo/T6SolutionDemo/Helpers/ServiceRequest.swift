//
//  ServiceRequest.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 28/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import Foundation
struct Constant
{
    
    
    static let POST = "POST"
    static let PUT = "PUT"
    static let DELETE = "DELETE"
    static let GET = "GET"
}



class ServerAPIRequest
{
    
    
    
    func httpPostConnectionWithURL(urlString: String, parameter: String, completion: @escaping (_ success: [String : AnyObject],NSData,Int) -> Void) {
        
        
        let url = NSURL(string: urlString)
        if url == nil {return}

        let request = NSMutableURLRequest(url: url! as URL)
        
        
        request.httpMethod = "POST"
        let postString = parameter
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        //        var err: NSError?
        
        do
        {
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                var statusCode : Int = 0
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                    print("Status code: (\(httpResponse.statusCode))")
                }
                
                if error != nil
                {
                    if(data != nil)
                    {
                        print("*****error \(String(describing: error))")
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                    }else{
                        print("*****error \(String(describing: error))")
                        let responseString : [String : AnyObject] = [:]
                        return
                        //                        completion(responseString,,statusCode)
                    }
                    
                    
                }else{
                    if(data != nil)
                    {
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                    }else{
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                        
                        
                    }
                    
                }
                
            })
            task.resume()
        }
    }
    
    func httpPostConnectionWithURLWithEncodedContentType(urlString: String, parameter: String, methodType: String, completion: @escaping (_ success: [String : AnyObject],NSData,Int) -> Void) {//[String : Any]
        
        let url = NSURL(string: urlString)
        if url == nil {return}

        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let parameter1 = ["branch_id" : "3"] as [String : Any]
        let request = NSMutableURLRequest(url: url! as URL)
        
        request.allHTTPHeaderFields = headers
        if methodType == Constant.POST{
            //            let jsonData : Data = parameter.data(using:String.Encoding.ascii, allowLossyConversion: false)!
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter1, options: .prettyPrinted)
                
            }catch let error{
                return
            }
            //            request.httpBody = jsonData
            request.httpMethod = Constant.POST
        }else if methodType == Constant.PUT{
            let jsonData : Data = parameter.data(using:String.Encoding.ascii, allowLossyConversion: false)!
            request.httpBody = jsonData
            request.httpMethod = Constant.PUT
        }else if methodType == Constant.GET{
            request.httpMethod = Constant.GET
        }else if methodType == Constant.DELETE{
            request.httpMethod = Constant.DELETE
        }else{
            request.httpMethod = Constant.POST
        }
        let session = URLSession.shared
        //        var err: NSError?
        
        do
        {
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                var statusCode : Int = 0
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                    print("Status code: (\(httpResponse.statusCode))")
                }
                
                if error != nil
                {
                    print("*****error \(String(describing: error))")
                    //                    let responseString : [String : AnyObject] = [:]
                    //                    completion(responseString,data! as NSData,statusCode)
                    
                }else{
                    if(data != nil)
                    {
                        
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                    }else{
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                        
                    }
                    
                }
                
            })
            task.resume()
        }
    }
   
    
    
    
    
    
    
    
    func httpPostConnectionWithURL(urlString: NSString, parameter: [String : String], methodType: String, completion: @escaping (_ success: [String : AnyObject],NSData,Int) -> Void) {//[String : Any]
                
        let urlStr : NSString = urlString.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        let searchURL : NSURL = NSURL(string: urlStr as String)!
        print(searchURL)
        

//        let url = NSURL(string: urlString as String)
        
        if searchURL == nil {
            DispatchQueue.main.async {
                ViewControllerUtils.shared.hideProgressView()
            };
            print("********Return")
            return
        }

        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let request = NSMutableURLRequest(url: searchURL as URL)
        request.allHTTPHeaderFields = headers
        if methodType == Constant.POST{
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            }catch let error{
                return
            }
            request.httpMethod = Constant.POST
        }else if methodType == Constant.PUT{
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            }catch let error{
                return
            }
            request.httpMethod = Constant.PUT
        }else if methodType == Constant.GET{
            request.httpMethod = Constant.GET
        }else if methodType == Constant.DELETE{
            request.httpMethod = Constant.DELETE
        }else{
            request.httpMethod = Constant.POST
        }
        let session = URLSession.shared
        //        var err: NSError?
        
        do
        {
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                var statusCode : Int = 0
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                    print("Status code: (\(httpResponse.statusCode))")
                }
                
                if error != nil
                {
                    print("*****error \(String(describing: error))")
                    //                    let responseString : [String : AnyObject] = [:]
                    //                    completion(responseString,data! as NSData,statusCode)
                    
                }else{
                    if(data != nil)
                    {
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                    }else{
                        let responseString : [String : AnyObject] = [:]
                        completion(responseString,data! as NSData,statusCode)
                        
                    }
                    
                }
                
            })
            task.resume()
        }
    }
    
   
    
   
    
}
