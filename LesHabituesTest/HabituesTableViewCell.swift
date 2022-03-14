//
//  HabituesTableViewCell.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import UIKit
import SDWebImage

class HabituesTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()
    private let cityLabel = UILabel()
    private let offerLabel = UILabel()
    private let iconView = UIImageView()
    
    class var cellIdentifier: String {
        return "HabituesTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIconView()
        configureNameLabel()
        configureAddressLabel()
        configureCityLabel()
        configureOfferLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureIconView() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    private func configureNameLabel() {
        nameLabel.font = UIFont(name: "Lato-Regular", size: 17)
        nameLabel.textColor = HabituesTableViewCell.UIColorFromRGB(0xC4C4C4)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureAddressLabel() {
        addressLabel.textColor = HabituesTableViewCell.UIColorFromRGB(0xC4C4C4)
        addressLabel.font = UIFont(name: "Lato-Regular", size: 15)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        addressLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    private func configureCityLabel() {
        cityLabel.font = UIFont(name: "Lato-Regular", size: 15)
        cityLabel.textColor = HabituesTableViewCell.UIColorFromRGB(0xC4C4C4)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cityLabel)
        cityLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        cityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        cityLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    private func configureOfferLabel() {
        offerLabel.font = UIFont(name: "Lato-Regular", size: 17)
        offerLabel.textColor = HabituesTableViewCell.UIColorFromRGB(0x4A90E2)
        offerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(offerLabel)
        offerLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        offerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        offerLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5).isActive = true
        offerLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func set(shop: Shop?) {
        nameLabel.text = shop?.chain.uppercased()
        addressLabel.text = shop?.localisations.first?.address
        cityLabel.text = (shop?.localisations.first?.zipcode ?? "") + " " + (shop?.localisations.first?.city ?? "")
        offerLabel.text = " Up to " + "\(shop?.offers.first?.reduction ?? "") € offered"
        if let picture = shop?.picture_url, let url = URL(string: picture) {
            iconView.sd_setImage(with: url, completed: nil)
        }
    }
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
}
