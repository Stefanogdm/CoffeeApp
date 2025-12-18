//
//  CategoriasViewModel.swift
//  T2-Base
//
//  Created by Suite on 17/12/25.
//

import Foundation

final class CategoriasViewModel {

    private let service = CategoriaService.shared

    private(set) var categorias: [Categoria] = []

    var onDataUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?

    func fetchCategorias() {
        service.fetchCategorias { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.categorias = data
                    self?.onDataUpdated?()
                case .failure(let error):
                    self?.onError?(error)
                }
            }
        }
    }
}

