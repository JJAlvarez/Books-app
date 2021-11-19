import Foundation

protocol BookProtocol {
    
    func onFeed(books: [Book])
    func onFeedError()
    func onInternetError()
}
