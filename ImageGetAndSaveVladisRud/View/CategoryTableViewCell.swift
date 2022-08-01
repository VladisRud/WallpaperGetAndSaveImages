//
//  CategoryTableViewCell.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 01.08.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    let leftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LEFT"
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "RIGHT"
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private var stackLabel: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        
        constrainsforLabel()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func constrainsforLabel() {
        leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        leftLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2).isActive = true
        
        rightLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        rightLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        rightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        rightLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2).isActive = true
    }

}
