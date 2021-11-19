import UIKit
import AlamofireImage
import Alamofire

class DashboardController: UITableViewController, BookProtocol {
    
    var books = [Book]()
    var api : ApiProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        self.api = API()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: Constants.CELL_NIB_IDENTIFIER, bundle: nil), forCellReuseIdentifier: Constants.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        if let api = self.api {
            api.getBooks(bookProtocol: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setBarStyle(traslucent: false)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_IDENTIFIER, for: indexPath) as! ListItem

        cell.setData(book: books[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.DETAILS_CONTROLLER_IDENTIFIER, sender: self.books[indexPath.row])
    }
    
    func onFeed(books: [Book]) {
        self.books = books
        self.tableView.reloadData()
    }
    
    func onFeedError() {
        self.performSegue(withIdentifier: Constants.FEED_ERROR_IDENTIFIER, sender: self)
    }
    
    func onInternetError() {
        self.performSegue(withIdentifier: Constants.NO_INTERNET_IDENTIFIER, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.DETAILS_CONTROLLER_IDENTIFIER {
            guard let book = sender as? Book else { return }
            let details : DetailsController = segue.destination as! DetailsController
            details.book = book
        }
    }

}

    

