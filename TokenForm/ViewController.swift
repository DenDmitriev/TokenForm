//
//  ViewController.swift
//  TokenForm
//
//  Created by Denis Dmitriev on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var tokens: [String] = [
        "MVI/MVVM",
        "Kotlin Coroutines",
        "Room",
        "OkHttp",
        "DataStore",
        "WorkManager",
        "DataStore"
    ]
    
    lazy var tokenCollectionView: UICollectionView = {
        let flowLayout = LeftAlignedCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTokenCollection()
    }

    private func configureTokenCollection() {
        tokenCollectionView.register(TokenCell.self, forCellWithReuseIdentifier: TokenCell.identifier)
        view.addSubview(tokenCollectionView)
        tokenCollectionView.dataSource = self
        tokenCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            tokenCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            tokenCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tokenCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tokenCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tokens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TokenCell.identifier, for: indexPath) as? TokenCell else { return UICollectionViewCell() }
        cell.set(tokens[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.font = TokenCell().tokenLabel.font
        label.text = tokens[indexPath.item]
        label.sizeToFit()
        let layout = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let width = layout.left + label.frame.width + layout.right
        let height = layout.top + label.frame.height + layout.bottom
        return CGSize(width: width, height: height)
    }
}
