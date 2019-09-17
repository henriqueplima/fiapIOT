//
//  FirabaseConnector.swift
//  camara01
//
//  Created by Usuário Convidado on 16/09/19.
//  Copyright © 2019 Usuário Convidado. All rights reserved.
//

import Foundation
import FirebaseDatabase

typealias Sucess = ((Float)-> Void)
typealias Failure = ((String) -> Void)

struct Temperatura: Codable {
    var temperatura: Float
}

class FirebaseConnector {
    
//   static var ref: DatabaseReference = Database.database().reference()
    
    static func fetchTemperature(sucess: @escaping Sucess, failure: @escaping Failure) {
    
    
    guard let url = URL(string: "http://10.3.6.3:1880/temperatura") else {
        return
    }
    let session = URLSession.shared
    var request = URLRequest(url: url)
    request.timeoutInterval = 20
    request.httpMethod = "GET"
    session.dataTask(with: request) { (response, _, error) in
        guard error == nil else {
            failure("Erro no servico")
            return
        }
        
        guard let data = response else {
            failure("Erro no servico")
            return
        }
        
    
        do {
            //here dataResponse received from a network request
            let decoder = JSONDecoder()
            let model = try decoder.decode(Temperatura.self, from:
                data) //Decode JSON Response Data
            sucess(model.temperatura)
        } catch let parsingError {
            failure("Erro no parsing")
        }
        
        
        
        }.resume()
    
    }
    
    
}
