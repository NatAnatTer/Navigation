//
//  DataFilePost.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.02.2023.
//

import Foundation

enum Strings{
    case yes
    case no
    case deletePost
    case didntDeletePost
    case deletedPost
    case delPost
    case postOne
    case postTwo
    case navItemTitle
    case tabBarFirst
    case tabBarSecond
    case tabBarTitleLine
    case tabBarTitleProfile
    case iconHome
    case iconPerson
    case statusText
    case iconProfile
    case nameOfProfile
    case setStatus
    case setStatusButton
    case enterText
    case iconClose
    case photosLabel
    case likes
    case views
    case iconLogo
    case placeholderLogin
    case placeholderPassw
    case loginButtonText
    case loginButtonColor
    case prompt
    case wrongLoginPassw
    case needToCheckLP
    case ok
    case defaultActionComment
    case logAllert
    case keyPath
    case iconArrowForward
    case photoGallery
    case delete
}

func getStrings(stringsEnum: Strings) -> String{
    switch stringsEnum{
    case .yes:
        return "Да"
    case .no:
        return "Нет"
    case .deletePost:
        return "Хотите удалить пост?"
    case .didntDeletePost:
        return "Не стали удалять пост"
    case .deletedPost:
        return "Удалили пост"
    case .delPost:
        return "Удалить пост"
    case .postOne:
        return "Пост"
    case .postTwo:
        return "Пост 2"
    case .navItemTitle:
        return "Лента"
    case .tabBarFirst:
        return "FirstNC"
    case .tabBarSecond:
        return "SecondNC"
    case .tabBarTitleLine:
        return "Лента"
    case .tabBarTitleProfile:
        return "Профиль"
    case .iconHome:
        return "house"
    case .iconPerson:
        return "person.circle"
    case .statusText:
        return "Waiting for something beautiful, pretty good"
    case .iconProfile:
        return "profileIcon"
    case .nameOfProfile:
        return "Hipster Cat"
    case .setStatus:
        return "Set your status"
    case .setStatusButton:
        return "Set status"
    case .enterText:
        return "Enter text"
    case .iconClose:
        return "xmark"
    case .photosLabel:
        return "Photos"
    case .likes:
        return "Likes"
    case .views:
        return "Views"
    case .iconLogo:
        return "logo"
    case .placeholderLogin:
        return "Email or phone"
    case .placeholderPassw:
        return "Password"
    case .loginButtonText:
        return "LogIn"
    case .loginButtonColor:
        return "BluePixel"
    case .prompt:
        return "Длина пароля должна быть не менее 4 символов"
    case .wrongLoginPassw:
        return  "Не верный логин или пароль"
    case .needToCheckLP:
        return "Проверьте правильность ввода логина и пароля"
    case .ok:
        return "OK"
    case .defaultActionComment:
        return "Default action"
    case .logAllert:
        return"The \"OK\" alert occured."
    case .keyPath:
        return "position"
    case .iconArrowForward:
        return "arrow.forward"
    case .photoGallery:
        return "Photo Gallery"
    case .delete:
        return "Delete"
    }
    
}

enum SizesOfElements{
    case fontSize20
    case cornerRadius12
    case stackSpacing
    case fontSize11
    case fontSize14
    case fontSize16
    case fontSize18
    
}

func getSizesOfElements(sizeEnum: SizesOfElements) -> Int{
    switch(sizeEnum){
    case .fontSize20:
        return 20
    case .cornerRadius12:
        return 12
    case .stackSpacing:
        return 10
    case .fontSize11:
        return 11
    case .fontSize14:
        return 14
    case .fontSize16:
        return 16
    case .fontSize18:
        return 18
    }
}

