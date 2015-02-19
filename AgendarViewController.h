//
//  AgendarViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKLocalNotificationsScheduler.h"

@interface AgendarViewController : UIViewController{
    
    IBOutlet UIDatePicker *datePicker;
    
}

@property(nonatomic)NSString *fechaInicial;
@property(nonatomic)NSString *hora;
@property(nonatomic)NSString *conferencia;

-(IBAction)Notificarme:(id)sender;

@end
