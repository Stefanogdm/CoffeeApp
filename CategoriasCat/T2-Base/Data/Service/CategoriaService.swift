//
//  CategoriaService.swift
//  T2-Base
//
//  Created by Suite on 17/12/25.
//

import Foundation

final class CategoriaService {

    static let shared = CategoriaService()
    private init() {}

    private let url = "https://mxhmimvdkzvjgwgeklov.supabase.co/rest/v1/categorias?select=*"

    func fetchCategorias(
        completion: @escaping (Result<[Categoria], Error>) -> Void
    ) {

        let headers = [
            "apikey": "sb_publishable_Ji-HOOg47_E-RXeqcF-czQ_ivUt-XCJ",
            "Authorization": "eyJhbGciOiJIUzI1NiIsImtpZCI6Im9PcXpTK2lmVEV4WnF2RHciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL214aG1pbXZka3p2amd3Z2VrbG92LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJjNjEwMDgyMy0xM2E2LTRjMzQtYTI4Yy0xZDMxMjQ5N2VkYmYiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzY2MDEwMzM1LCJpYXQiOjE3NjYwMDY3MzUsImVtYWlsIjoiY2FybG9zQHRlc3QuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJlbWFpbF92ZXJpZmllZCI6dHJ1ZX0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjYwMDY3MzV9XSwic2Vzc2lvbl9pZCI6ImFhOGRmOGQzLTljNDAtNDI2ZC1iNjYzLTMyN2MzYThiZDZjNSIsImlzX2Fub255bW91cyI6ZmFsc2V9.uTBD_zB8YxYL8OzVtTMfJXI1_9aNiyiUT8noQknqQ-8"
        ]

        APICaller.shared.request(
            url: url,
            method: "GET",
            body: Optional<String>.none,
            headers: headers,
            completion: completion
        )
    }
}
