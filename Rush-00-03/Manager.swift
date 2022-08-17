//
//  Manager.swift
//  Rush-00-03
//
//  Created by Сергей Хмизюк on 17.08.2022.
//

import UIKit

class Manager {

    static let shared = Manager()

    func loadImage(with url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil)
            }

            guard let data = data else {
                print("No data available")
                completion(nil)
                return
            }

            let image = UIImage(data: data)
            completion(image)

        }.resume()
    }

}
