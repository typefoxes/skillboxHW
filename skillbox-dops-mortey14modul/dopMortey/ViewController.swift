
import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let realm = try! Realm()
    
    
    var morteys: [MorteyData] = []
    var images: [UIImage] = []
    var currentPage = 1
    var refreshControl = UIRefreshControl()
    
    
    func loadData(page: Int) {
        let session = URLSession.shared
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)")!
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                do {
                   
                    
                    DispatchQueue.main.async {
                        if self.currentPage <= 34 && self.currentPage != 35 {
                            let model: MorteyDataAll = try! JSONDecoder().decode(MorteyDataAll.self, from: data)
                            try! self.realm.write({
                                 self.realm.add(model)
                            })
                            self.morteys += model.results
                            self.collectionView.reloadData()
                            self.currentPage += 1
                        }
                    }
                   
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "UserSelectViewController") as? UserSelectViewController
        vc?.name = morteys[indexPath.row].name
        vc?.gender = morteys[indexPath.row].gender
        vc?.location = morteys[indexPath.row].location?.name ?? "Who knows?"
        vc?.species = morteys[indexPath.row].species
        vc?.status = morteys[indexPath.row].status
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

