//
//  Post.swift
//  Navigation
//
//  Created by Наталья Терзьян on 15.01.2023.
//

import Foundation


struct Post{
    let author: String
    let descriptionOfPost: String
    let imageOfPost: String
    var likes: Int
    var views: Int
    var isShortDecription: Bool
}



let postOne = Post(author: "Asynchronously Loading Images into Table and Collection Views", descriptionOfPost: "Не говори: здесь линии одни. На их игру внимательно взглянию Change the height of rowsю A table view tracks the height of rows separately from the cells that represent them. UITableView provides default sizes for rows, but you can override the default height by assigning a custom value to the table view’s rowHeight property. Always use this property when the height of all of your rows is the same. Doing so is more efficient than returning the height values from your delegate object.", imageOfPost: "postOne", likes: 400, views: 100, isShortDecription: true)
let postTwo = Post(author: "Funny animals", descriptionOfPost: "Логика может привести Вас от пункта А к пункту Б, а воображение — куда угодно.", imageOfPost: "postTwo", likes: 500, views: 200, isShortDecription: true)
let postThree = Post(author: "Psychology", descriptionOfPost: "Все дело в мыслях. Мысль — начало всего. И мыслями можно управлять. И поэтому главное дело совершенствования: работать над мыслями.", imageOfPost: "postThree", likes: 600, views: 300, isShortDecription: true)
let postFour = Post(author: "Different content", descriptionOfPost: "Сложнее всего начать действовать, все остальное зависит только от упорства.", imageOfPost: "postFour", likes: 700, views: 400, isShortDecription: true)

var arrayOfPhoto:[String] = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10", "img11", "img12", "img13", "img14", "img15", "img16", "img17", "img18", "img19", "img20"]
