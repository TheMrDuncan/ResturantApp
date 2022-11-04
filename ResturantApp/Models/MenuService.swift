import Foundation

final class MenuService: ObservableObject {
    
    static let shared = MenuService()
    static let urlString = "https://burgertory-menu-api.herokuapp.com/list"
    
    init() {
        
    }
    
    public static func getMenuData() async  -> [Menu] {
        
        guard let url = URL(string: urlString) else {
            return []
        }
        
        let downloadTask = Task { ()  -> [Menu] in
            let (menuData, httpResponse) = try await URLSession.shared.data(from: url)
            
            guard let response = httpResponse as? HTTPURLResponse,
                  let data = menuData as? Data
            else {
                print ("Invalid response from server")
                return []
            }
            switch response.statusCode  {
            case 200..<300:
                guard let apiResponse = try? JSONDecoder().decode([Menu].self, from: data) else {
                    print ("Error decoding data")
                    return []
                }
                return apiResponse
            default:
                print("Unknown error has occurred while fetching data from the server")
                return []
            }
        }
        
        let result = await downloadTask.result
        
            do {
                let menus = try result.get()
                return menus
            } catch {
                print("Unknown error.")
                return []
            }
    }
    
    
}
