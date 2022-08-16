import UIKit

// Class Without Single Responsiblity
struct EmployeeModel {
    
    let name: String?
    let employeeId : Int?
    let address : String?
    
}


// This class is created without Single Responsiblity
class Employee {
    
    func getEmployeeData() {
        let employeeResponse = callEmployeeApi()
        let employeeData = parseApiResponse(parse: employeeResponse)
        saveDataToDatabase(data: employeeData)
    }
    
    private func callEmployeeApi()-> Data {
        
       // Call Server API
      return Data()
    }
    
    private func parseApiResponse(parse: Data) -> Array<EmployeeModel> {
        // Parse the server api json response to model
        return Array<EmployeeModel>()
    }
    
    private func saveDataToDatabase(data: Array<EmployeeModel>) {
        // Save API Response to Database
        
    }
}

// Using Single Responsblity we will create the different classes

class HttpHandler {
    
    func getDataFromApi()-> Data {
        
        return Data()
    }
}

class Parser {
    
    func parseApiResponse(parse: Data) ->Array<EmployeeModel> {
        
        return Array<EmployeeModel>()
    }
    
}

class DatabaseHandler {
    
    func saveData(data: Array<EmployeeModel>) {
        
        
        
    }
    
}

class Employee1 {
    
    let _httpHandler: HttpHandler
    let _parser: Parser
    let _databaseHandler: DatabaseHandler
    
    init(httpHandler: HttpHandler, parser: Parser, databaseHandler: DatabaseHandler) {
        _httpHandler = httpHandler
        _parser = parser
        _databaseHandler = databaseHandler
    }
    
    func getEmployeeData() {
        
        let employeeResponse = _httpHandler.getDataFromApi()
        let employeeData = _parser.parseApiResponse(parse: employeeResponse)
        _databaseHandler.saveData(data: employeeData)
    }
}
