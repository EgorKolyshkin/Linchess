//
//  Networking.swift
//  Linchess
//
//  Created by Егор on 06/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct Networking {
    
    func performNetworkTask<T: Decodable>(endpoint: ChessApi, type: T.Type, completion: ((_ response: T) -> Void)?) {
        
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        print(url)
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        
        urlSession.resume()
    }
}
