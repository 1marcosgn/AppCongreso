//
//  ContactoViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>  

@interface ContactoViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    
    IBOutlet UITextField *textNombre;
    IBOutlet UITextField *textEmail;
    IBOutlet UITextField *textAsunto;
    IBOutlet UITextView *textMensaje;
    
    IBOutlet UIScrollView *scrollCorreo;
    
    IBOutlet UIButton *buttonBanner;
    
}

@property(nonatomic)NSString *ligaGlobal;
@property(nonatomic)NSString *imagenGlobal;


-(IBAction)CargarBanner:(id)sender;

-(IBAction)EnviarCorreo:(id)sender;
-(IBAction)OcultarTextoMensaje:(id)sender;
-(IBAction)Ocultarteclado:(id)sender;

@end
