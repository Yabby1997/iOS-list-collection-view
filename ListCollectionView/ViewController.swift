//
//  ViewController.swift
//  ListCollectionView
//
//  Created by Seunghun Yang on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.collectionViewLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Properties
    
    private let collectionViewLayout: UICollectionViewCompositionalLayout = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }()
    
    var emojis: [String] = ["😁", "🔥", "🥺", "🤔", "✨", "😀", "😍", "😎", "🤚", "👊", "❄️", "❤️", "🔔"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.text = emojis[indexPath.item]
        return cell
    }
}

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    // MARK: - Properties
    
    var text: String? {
        didSet { self.label.text = self.text }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }
    // MARK: - Helpers
    
    private func configureUI() {
        self.contentView.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}
