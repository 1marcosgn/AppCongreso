//
//  GaleriaDestinoViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface GaleriaDestinoViewController : UIViewController{
    
    IBOutlet UINavigationItem *navBar;
    IBOutlet UIImageView *imagenGaleria;
    IBOutlet UILabel *labelDescripcion;
    
    IBOutlet UIButton *buttonBanner;
    
}

@property(nonatomic)NSString *nombreNavegacion;
@property(nonatomic)NSString *nombreImagen;

@property(nonatomic)NSString *destinoLiga;
@property(nonatomic)NSString *destinoImagen;


-(IBAction)TweetFoto:(id)sender;
-(IBAction)CargarBanner:(id)sender;

@end
