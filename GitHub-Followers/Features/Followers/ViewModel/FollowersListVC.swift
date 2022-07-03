//
//  FollowerListVC.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 18/06/22.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section  {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var page: Int = 1
    var hasMoreFollwers = true
    var collection: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getData(username: username, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView () {
        collection = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
        view.addSubview(collection)
        collection.delegate = self
        collection.backgroundColor = .systemBackground
        collection.register(FollwersCell.self, forCellWithReuseIdentifier: FollwersCell.reuseID)
    }
    
    
    func configureDataSource () {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collection, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollwersCell.reuseID, for: indexPath) as! FollwersCell
            cell.set(followers: follower)
            return cell
        })
    }
     
    func getData (username: String, page: Int) {
        NetWorkManager.shared.getDataFollowers(username: username, page: page) { [weak self]result in
            
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollwers = false }
                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentASAlertOnMainThread(title: "Algo deu errado", message: error.rawValue, buttonTitle: "Ok")
                
            }
        }
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.sync {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
extension FollowersListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY       = scrollView.contentOffset.y
        let contentHeigth = scrollView.contentSize.height
        let height        = scrollView.frame.size.height
        
        if offsetY > contentHeigth - height {
            
            guard hasMoreFollwers else { return }
            page += 1
            getData(username: username, page: page)
        }
    }
}
