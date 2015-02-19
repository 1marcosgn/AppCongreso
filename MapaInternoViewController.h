//
//  MapaInternoViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapaInternoViewController : UIViewController <UIActionSheetDelegate, UIScrollViewDelegate>{
    
    IBOutlet UIActionSheet *actionInfo;
    
    IBOutlet UIScrollView *scrollMapa;
    
    IBOutlet UIView *vistaMapas;
    
    IBOutlet UILabel *labeVistaTitulo;
    IBOutlet UILabel *labelVistaDesc;
    IBOutlet UIImageView *imageMapa;
    IBOutlet UIButton *buttonClose;
    
    IBOutlet UIButton *buttonBanner;
}

@property(nonatomic)NSString *ligaGlobal;
@property(nonatomic)NSString *imagenGlobal;


-(IBAction)CargarBanner:(id)sender;


-(IBAction)MuestraInfo:(id)sender;



-(IBAction)controlPan:(UIPanGestureRecognizer *)recognizer;

-(IBAction)ocultaVista:(id)sender;


@end
