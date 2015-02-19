//
//  ConferenciasViewController.h
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h> 
#import <Accounts/Accounts.h>
#import <MapKit/MapKit.h>

@interface ConferenciasViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate>{
    
    IBOutlet UINavigationItem *navConferencias;
    IBOutlet UIScrollView *scrollPrincipal;
    
    
    IBOutlet UILabel *labelConferencista;
    
    IBOutlet UIImageView *imagenFoto;
    
    IBOutlet UILabel *labelTemas;
    IBOutlet UILabel *labelFecha;
    IBOutlet UILabel *labelHora;
    IBOutlet UILabel *labelDireccion;
    IBOutlet UILabel *labelCiudad;
    
    IBOutlet MKMapView *mapaCongreso;
    
    
    
}

@property(nonatomic)NSString *conferenciaNombre;

@property(nonatomic)NSString *propAbrevia;
@property(nonatomic)NSString *propConferencista;
@property(nonatomic)NSString *propTemas;
@property(nonatomic)NSString *propFecha;
@property(nonatomic)NSString *propHora;
@property(nonatomic)NSString *propDireccion;
@property(nonatomic)NSString *propCiudadEstado;
@property(nonatomic)NSString *propLatitud;
@property(nonatomic)NSString *propLongitud;

-(IBAction)Tweet:(id)sender;

-(IBAction)takePicture:(id)sender;

-(IBAction)TweetFoto:(id)sender;

@end
