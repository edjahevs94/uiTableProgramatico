//
//  CustomTableViewCell.swift
//  tableViewProgamatico
//
//  Created by EdgardVS on 30/03/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.isOn = true
        return _switch
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imageView.image = UIImage(named: "Image2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        //label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Celda custom"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = .darkGray
        contentView.addSubview(_switch)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        myLabel.text = text
        myImageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //para poder reusar las celda es una buena practica vaciar la celda
        myLabel.text = nil
        myImageView.image = nil 
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 6
        
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
        _switch.frame = CGRect(x: 5,
                               y: (contentView.frame.size.height - switchSize.height)/2,
                               width: 100
                               , height: contentView.frame.size.height - 10)
        myLabel.frame = CGRect(x: 10 + _switch.frame.size.width,
                               y: 0,
                               width: contentView.frame.size.width - 10 - _switch.frame.size.width - imageSize,
                               height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
        
        //imagen redondeada
        myImageView.layer.cornerRadius = myImageView.frame.size.width / 2
    }
}
