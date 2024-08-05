//
//  AnimeService.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 27/06/24.
//

import Foundation

class AnimeService {
    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }

    func fetchAnimeDetails(animeId: Int, completion: @escaping (Result<Anime, Error>) -> Void) {
        // Primeiro, obtenha o token de acesso
        authService.getToken { result in
            switch result {
            case .success(let token):
                // Agora você pode fazer a solicitação para buscar detalhes do anime usando o token
                self.fetchAnimeDetailsWithToken(animeId: animeId, accessToken: token, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchAnimeDetailsWithToken(animeId: Int, accessToken: String, completion: @escaping (Result<Anime, Error>) -> Void) {
        let apiUrl = URL(string: "https://api.anilist.co/v2/anime/\(animeId)")!
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Dados não recebidos", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let anime = try decoder.decode(Anime.self, from: data)
                completion(.success(anime))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    // Outros métodos para interagir com a API da AniList podem ser adicionados aqui
}
