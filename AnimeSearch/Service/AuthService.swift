//
//  AuthService.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 29/06/24.
//

import Foundation
import UIKit

class AuthService {
    
    func getToken(completion: @escaping (Result<String, Error>) -> Void) {
        let clientId = "19564"
        let clientSecret = "DWkMhlZPC4s8dnmQXQ6spJLP3N3XxC8pP7H07Bqi"
        let apiUrl = URL(string: "https://anilist.co/api/v2/oauth/token")!
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyParams: [String: Any] = [
            "client_id": clientId,
            "client_secret": clientSecret,
            "grant_type": "client_credentials"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
        } catch {
            print("Erro ao serializar dados JSON: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Erro na solicitação de token: \(error)")
                return
            }
            
            guard let data = data else {
                print("Não foram recebidos dados da API")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let accessToken = json["access_token"] as? String ?? ""
                    print("Token de acesso recebido: \(accessToken)")
                    // Aqui você pode salvar o token de acesso para uso posterior
                }
            } catch {
                print("Erro ao decodificar resposta JSON: \(error)")
            }
        }.resume()
    }
    
}
