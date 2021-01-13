//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by André Dauzat on 13/01/2021.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a IURLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any rrors
            if error != nil || data == nil {
                return
            }
            
            // Parsingthe data into video objects
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}
