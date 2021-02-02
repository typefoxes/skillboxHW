
import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let realm = try! Realm()
    
    
    var morteys: [MorteyData] = []
    var images: [UIImage] = []
    var currentPage = 1
    var isLoading = false
    var refreshControl = UIRefreshControl()
    
    
    func loadData(page: Int) {
        let session = URLSession.shared
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)")!
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                do {
                    let morteyDataAll: MorteyDataAll = try! JSONDecoder().decode(MorteyDataAll.self, from: data)
                    
                    DispatchQueue.main.async {
                        if self.currentPage <= 34 && self.currentPage != 35 {
                            
                            try! self.realm.write({
                                let model: MorteyDataAll = try! JSONDecoder().decode(MorteyDataAll.self, from: data)
                                
                                self.realm.add(model)
                                self.morteys += model.results
                                self.collectionView.reloadData()
                                self.currentPage += 1
                            })
                        }}
                    if  self.isLoading == true { self.isLoading = false }
                } catch { print(error.localizedDescription) }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(page: currentPage)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Загрузка...")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        print("scroll ended")
        loadData(page: currentPage)
        collectionView.reloadData()
        print(morteys)
        refreshControl.endRefreshing()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return morteys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let mortey = morteys[indexPath.row]
        
        cell.nameLabel.text = mortey.name
        cell.statusLabel.text =  mortey.status
        cell.spiciesLabel.text =  mortey.species
        cell.lacationNameLabel.text =  mortey.location?.name
        cell.genderLabel.text =  mortey.gender
        
        cell.imageView.layer.cornerRadius = 15
        cell.layer.cornerRadius = 15
        cell.imageView.layer.borderWidth = 3
        cell.layer.borderWidth = 3
        
        func getImages(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        func loadImage(from url: URL) {
            getImages(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    cell.imageView.image = UIImage(data: data)
                }
            }
        }
        let url = URL(string: mortey.image)!
        loadImage(from: url)
        return cell
    }
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegue(withIdentifier: "testSegue", sender: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let UserSelectViewController = storyboard.instantiateViewController(identifier: "UserSelectViewController") as? UserSelectViewController else { return }
        UserSelectViewController.nameU.placeholder = "Попытка1"
                
                show(UserSelectViewController, sender: nil)
            }
        }

