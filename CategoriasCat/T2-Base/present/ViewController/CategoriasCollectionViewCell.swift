//
//  CategoriasCollectionViewCell.swift
//  T2-Base
//
//  Created by Suite on 15/12/25.
//
import UIKit

class CategoriasCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageCollect: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configurarUI()
    }

    private func configurarUI() {
        // Card
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 6

        // Imagen
        imageCollect.contentMode = .scaleAspectFit
        imageCollect.clipsToBounds = true

        // Texto
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .darkGray
    }

    func configurar(with categoria: Categoria) {
        titleLabel.text = categoria.nombre
        imageCollect.loadFrom(urlString: categoria.imagenURL)
    }
}
