//
//  ViewModel.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import Foundation
import Alamofire

class ViewModel {
    
    var model: Model?
    
    func fetchShops(completion: @escaping () -> Void, onError: @escaping () -> Void) {
        AF.request("https://www.leshabitues.fr/testapi/shops").responseDecodable(of: Model.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let model):
                self.model = model
                completion()
            case .failure(let error):
                onError()
            }
        }
    }
}
