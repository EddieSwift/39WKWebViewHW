//
//  TableViewController.h
//  39WKWebViewHW
//
//  Created by Eduard Galchenko on 5/7/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

NS_ASSUME_NONNULL_END


/*
 Задание следующее:
 
 1. Сделайте один контроллер с таблицей, в ней две секции: pdf и url
 2. Присоедините к проекту парочку pdf файлов, их имена должны быть в таблице
 3. Добавьте парочку web сайтов во вторую секцию
 4. Когда я нажимаю на ячейку, то через пуш навигейшн должен отобразиться либо пдф либо web
 5. Надеюсь понятно что для загрузки того либо другого мы используем один и тот же контроллев с UIWebView и иницианизируем его нужным NSURL
 6. На веб вью должна быть крутилка, а в навигейшине кнопки назад и вперед
 */
