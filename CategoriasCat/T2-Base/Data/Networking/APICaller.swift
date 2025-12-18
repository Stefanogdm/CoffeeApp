//
//  APICaller.swift
//  semana4.1
//
//  Created by Suite on 6/12/25.
//

import Foundation

final class APICaller {

    static let shared = APICaller()
    private init() {}

    func request<T: Codable, R: Codable>(
        url: String,
        method: String,
        body: T?,
        headers: [String: String] = [:],
        completion: @escaping (Result<R, Error>) -> Void
    ) {

        guard let endpoint = URL(string: url) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: endpoint)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                completion(.failure(error))
                return
            }
        }

        URLSession.shared.dataTask(with: request) { data, response, error in

            if let error {
                completion(.failure(error))
                return
            }

            guard let http = response as? HTTPURLResponse,
                  (200...299).contains(http.statusCode) else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            guard let data else {
                completion(.failure(URLError(.cannotDecodeRawData)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(R.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
}
