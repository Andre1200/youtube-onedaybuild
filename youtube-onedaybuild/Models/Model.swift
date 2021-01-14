//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by André Dauzat on 13/01/2021.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    
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
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        // Call the "VideosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }

                    // dump(response)
                }
                
            }
            catch {
                
            }
            
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}
