//
//  TokenCell.swift
//  TokenForm
//
//  Created by Denis Dmitriev on 01.08.2023.
//

import UIKit

class TokenCell: UICollectionViewCell {
    
    static let identifier = "TokenCell"
    
    // MARK: - Subviews
    
    let tokenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Constriction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    // MARK: - UI
    
    private func configureSubviews() {
        contentView.addSubview(tokenLabel)
    }
    
    private func configureView() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    // MARK: - Methods
    
    func set(_ text: String) {
        tokenLabel.text = text
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tokenLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tokenLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tokenLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tokenLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

