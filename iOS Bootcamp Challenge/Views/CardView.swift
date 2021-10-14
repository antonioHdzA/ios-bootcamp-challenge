//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var abilitesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var baseExperienceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }
        //var weight: String?
        //var abilities: String?
        card.items.forEach { item in
            switch item.title{
            case "Weight":
                weightLabel.text = "Weight: " + item.description;
            case "Abilities":
                abilitesLabel.text = item.title + ": " + item.description;
            case "Base Experience":
                baseExperienceLabel.text = "Base Experience: " + item.description
            default:
                weightLabel.text = "There's no information"
                
            }
        }
        
        titleLabel.text = card.title
        
        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true

        // TODO: Display pokemon info (eg. types, abilities)
        addSubview(weightLabel)
        weightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin).isActive = true
        weightLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        weightLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true
        
        addSubview(baseExperienceLabel)
        baseExperienceLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: margin).isActive = true
        baseExperienceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        baseExperienceLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true
        
        addSubview(abilitesLabel)
        abilitesLabel.topAnchor.constraint(equalTo: baseExperienceLabel.bottomAnchor, constant: margin).isActive = true
        abilitesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        abilitesLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true
        
    }

}
