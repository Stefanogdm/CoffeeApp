//
//  UIImageView.swift
//  T2-Base
//
//  Created by Suite on 17/12/25.
//

import UIKit  
extension UIImageView {

    func loadFrom(urlString: String) {
        image = UIImage(named: "placeholder")

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard
                let self = self,
                let data = data,
                let image = UIImage(data: data)
            else { return }

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
