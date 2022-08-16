//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let employeesDetailURL = "https://demo7846981.mockable.io/employeeDetail"


struct Employee: Codable {
    let name: String
    let employeeId: String
    let title: String
}
struct EmployeeModel: Codable {
    
    let Employees: [Employee]?
    
}

class HttpHandler {
    func getDataFromAPI<T: Codable>(url: String, resultType:T.Type, completionHandler: @escaping(_ resultData: T?, _ error: Error?)-> Void ) {
        
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, error == nil {
                do {
                    let responseObject = try? JSONDecoder().decode(T.self, from: data)
                    completionHandler(responseObject, nil)
                }
                catch {
                    debugPrint("Error Occured during decoding")
                }
            }
        }.resume()
        
    }
}

class DataParser {
    func parseData<T:Codable>(data: Data, resultType:T.Type) -> T?{
        do {
        let responseObject = try? JSONDecoder().decode(T.self, from: data)
        return responseObject
        }
    }
}


let httpHandler = HttpHandler()

httpHandler.getDataFromAPI(url: employeesDetailURL, resultType: EmployeeModel.self) { resultData, error in
    
    if let resultData = resultData {
        print(resultData)
    }
    
}


//: [Next](@next)
