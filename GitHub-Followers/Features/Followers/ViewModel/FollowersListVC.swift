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
    var collection: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getData ()
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
        collection = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collection)
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
     
    
    func getData () {
        NetWorkManager.shared.getDataFollowers(username: username, page: 1) { [weak self]result in
            guard let self = self else {return}
            
            switch result {
            case .success(let followers):
                self.followers = followers
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
    
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWith                    = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize =  CGSize(width: itemWith, height: itemWith + 40)
        return flowLayout
    }
     
}
