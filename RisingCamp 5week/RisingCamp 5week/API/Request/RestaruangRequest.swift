//
//  WeatherRequest.swift
//  Rising Camp 5week
//
//  Created by 김진수 on 2022/07/06.
//

import Alamofire
import UIKit

class RestaruangRequest {
    
//    func getWeatherData(_ viewController: ViewController) {
//        let url = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=52bcfbbef4941fe7beda2978f937e45e"
//
//        let params: Parameters = [
//            "q" : "seoul",
//            "appid" : "52bcfbbef4941fe7beda2978f937e45e"
//        ]
//
//        // HTTP Method: Get
//        AF.request(url,
//                   method: .get,
//                   parameters: params,
//                   headers: nil)
//        .responseDecodable(of: WeatherResponse.self) { response in
//
//            switch response.result {
//
//            case .success(let response):
//                print("DEBUG>> OpenWeather Response \(response)")
//                viewController.didSuccess(response)
//
//            case .failure(let error):
//                print("DEBUG>> OpenWeather Response \(error.localizedDescription)")
//
//
//            }
//        }
        
        
//    }
    
    
    
    func getRestaruantData(_ viewController: ViewController) {
        let url = "https://apis.data.go.kr/6430000/cbRecreationalFoodInfoService/getRecreationalFoodInfo?serviceKey=H5H%2FpJwi0HPyW4jWHQ29PUm8GLiNnZGan5B9zHUSKE11nKzUyfU92jcwBHnqUqRZYWRmyYdvbxiASotfsdwKhw%3D%3D"

                // HTTP Method: Get
                AF.request(url,
                           method: .get,
                           headers: nil)
                .responseDecodable(of: RestaurangResponse.self) { response in
        
                    switch response.result {
        
                    case .success(let response):
                        print("\(response)")
                        viewController.didSuccess(response)
        
                    case .failure(let error):
                        print("\(error.localizedDescription)")
        
        
                        
                    }
                }
                
    }
    
    
    
    

}
