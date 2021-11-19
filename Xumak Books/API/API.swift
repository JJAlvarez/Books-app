import Foundation
import Alamofire

class API : ApiProtocol {
    
    private let ENDPOINT = "http://de-coding-test.s3.amazonaws.com/books.json"
    
    func getBooks(bookProtocol: BookProtocol) {
        AF.request(ENDPOINT)
            .responseData { response in
            switch response.result {
            case .failure(_):
                self.checkConnectivity(bookProtocol: bookProtocol)
            case .success(let data):
                do {
                    let books = try JSONDecoder().decode([Book].self, from: data)
                    bookProtocol.onFeed(books: books)
                } catch _ {
                    self.checkConnectivity(bookProtocol: bookProtocol)
                }
            }
        }
    }
    
    func checkConnectivity(bookProtocol: BookProtocol) {
        if Connectivity.isConnectedToInternet {
            bookProtocol.onFeedError()
         } else {
            bookProtocol.onInternetError()
        }
    }
}
