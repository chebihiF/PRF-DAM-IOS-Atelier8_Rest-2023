//
//  DataService.swift
//  Atelier8_Rest
//
//  Created by CHEBIHI FAYCAL on 16/5/2023.
//

import Foundation

class DataService {
    static let shared = DataService()
    fileprivate let baseURLString = "https://api.github.com"
    
    func fetchGists(completion: @escaping(Result<Any, Error>) -> Void) {
        /*var baseURL = URL(string: baseURLString)
        baseURL?.appendPathComponent("/gists")
        let copusedURL = URL(string: "/gists", relativeTo: baseURL)
        
        print(baseURL!)
        print(copusedURL?.absoluteString ?? "Relative URL failed ....")*/
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
        guard let validUrl = componentURL.url else {
            print("URL creation failed ...")
            return
        }
        
        URLSession.shared.dataTask(with: validUrl) {
            (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                completion(.success(json))
            }catch let serializationError {
                completion(.failure(serializationError))
            }
            
        }.resume()
    }
    
}
