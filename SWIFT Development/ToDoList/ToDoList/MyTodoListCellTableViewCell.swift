//
//  MyTodoListCellTableViewCell.swift
//  ToDoList
//
//  Created by Nidhi Mishra on 3/17/23.
//

import UIKit


class MyTodoListCellTableViewCell: UITableViewCell {
    

    @IBOutlet weak var checkBoxRef: UIImageView!
    @IBOutlet weak var labelRef: UILabel!
    let identifier = "MyTodoListCellTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
