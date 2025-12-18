//
//group present/ViewController
//  CollectionViewDataSource.swift
//  T2-Base
//
//  Created by Suite on 17/12/25.
//

import UIKit

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.categorias.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoriasCollectionViewCell",
            for: indexPath
        ) as? CategoriasCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configurar(with: viewModel.categorias[indexPath.row])
        return cell
    }
}
