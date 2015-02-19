//
//  EmpresaViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface EmpresaViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    
    IBOutlet UIImageView *imagenArrow;
    IBOutlet UILabel *labelTouch;
    
}

-(IBAction)EnviarCorreo:(id)sender;
-(IBAction)OpenFipade:(id)sender;

@end
