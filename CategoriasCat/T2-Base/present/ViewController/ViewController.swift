//
//  ViewController.swift
//  pruebaa
//
//  Created by Jhonatan Chavez  on 9/12/25.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionCat: UICollectionView!

    let viewModel = CategoriasViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        bindViewModel()
        loadData()
    }
}

// MARK: - Setup
extension ViewController {

    private func setupUI() {
        view.backgroundColor = UIColor(
            red: 237/255,
            green: 237/255,
            blue: 237/255,
            alpha: 1
        )
    }

    private func setupCollectionView() {
        collectionCat.dataSource = self
        collectionCat.delegate = self
        collectionCat.backgroundColor = .clear

        if let layout = collectionCat.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }

        collectionCat.register(
            UINib(nibName: "CategoriasCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CategoriasCollectionViewCell"
        )
    }
}

// MARK: - Binding
extension ViewController {

    private func bindViewModel() {
        viewModel.onDataUpdated = { [weak self] in
            self?.collectionCat.reloadData()
        }

        viewModel.onError = { [weak self] error in
            self?.mostrarError(error)
        }
    }

    private func loadData() {
        viewModel.fetchCategorias()
    }

    private func mostrarError(_ error: Error) {
        print("❌ Error:", error)
    }
}

// MARK: - Delegate
extension ViewController: UICollectionViewDelegate {}
