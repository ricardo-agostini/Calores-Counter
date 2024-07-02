//
//  ReadFoodResponse.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 01/07/24.
//

import Foundation

class ReadData: ObservableObject  {

    func readData(gptResponse: String) -> Food? {
        
        if let jsonData = gptResponse.data(using: .utf8) {
            
            do {
                let decoder = JSONDecoder()
                let foodInfo = try decoder.decode(Food.self, from: jsonData)
                return foodInfo
            }
            catch {
                print("erro ao decodar")
            }
            
        } else {
            print("Erro ao converter")
        }
        
        return nil
        
    }
    
    func extractJSONContent(from jsonString: String) -> String {
        guard let startIndex = jsonString.firstIndex(of: "{"),
              let endIndex = jsonString.lastIndex(of: "}") else {
            return ""
        }
        
        let range = startIndex...endIndex
        let extractedString = jsonString[range]
        
        return String(extractedString)
    }
    
    
    
}
