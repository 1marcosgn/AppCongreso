//
//  ConferenciasViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConferenciasViewController.h"
#import "mapAnnotation.h"
#import "AgendarViewController.h"

@interface ConferenciasViewController ()

@end

@implementation ConferenciasViewController

@synthesize conferenciaNombre,propHora,propFecha,propTemas,propAbrevia,propLatitud,propLongitud,propDireccion,propCiudadEstado,propConferencista;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

float latitud, longitud;

- (void)viewDidLoad
{
        /*
        //Navigation Bar - Estilo
        UIImage *navimage = [[UIImage imageNamed:@"headvacio.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        [[UINavigationBar appearance] setBackgroundImage:navimage forBarMetrics:UIBarMetricsDefault];
        
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],UITextAttributeTextColor, [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont, nil]];
        */

    
    [super viewDidLoad];
	
    [scrollPrincipal setScrollEnabled:YES];
    [scrollPrincipal setContentSize:CGSizeMake(50, 840)];
    
    navConferencias.title = propAbrevia;
    labelCiudad.text = propCiudadEstado;
    labelConferencista.text = propConferencista;
    labelDireccion.text = propDireccion;
    labelFecha.text = propFecha;
    labelHora.text = propHora;
    labelTemas.text = propTemas; //conferenciaNombre;
    
    latitud = [propLatitud floatValue];
    longitud = [propLongitud floatValue];
    
    [self AnotacionMapa:latitud longitudMapa:longitud];
    
    
    //cambiar color Boton Back
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Atrás" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    backButton.tintColor = [UIColor brownColor];
    self.navigationItem.backBarButtonItem = backButton;
    
}

-(void)AnotacionMapa:(float)latitudMapa longitudMapa:(float)longitudMapa{
    
    
    //Ubica el placemark en el mapa dependiendo de la longitud y latitud que recibe
    
    MKCoordinateRegion regionCongreso;
    regionCongreso.center.latitude= latitudMapa;
    regionCongreso.center.longitude= longitudMapa;
    regionCongreso.span.longitudeDelta=0.01;
    regionCongreso.span.latitudeDelta=0.01;
    [mapaCongreso setRegion:regionCongreso animated:YES];
    
    mapAnnotation *annCongreso=[[mapAnnotation alloc]init];
    annCongreso.title=@"Red ESR";
    annCongreso.subtitle= propDireccion;
    annCongreso.coordinate=regionCongreso.center;
    [mapaCongreso addAnnotation:annCongreso];  
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)Tweet:(id)sender{
     
    //  Create an instance of the Tweet Sheet
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
    
    // Sets the completion handler.  Note that we don't know which thread the
    // block will be called on, so we need to ensure that any UI updates occur
    // on the main queue
    tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result) {
        switch(result) {
            case TWTweetComposeViewControllerResultCancelled:
                //  This means the user cancelled without sending the Tweet
                break;
            case TWTweetComposeViewControllerResultDone:
                //  This means the user hit 'Send'
                break;
        }
        
        
        //  dismiss the Tweet Sheet 
        dispatch_async(dispatch_get_main_queue(), ^{            
            [self dismissViewControllerAnimated:YES completion:^{
                NSLog(@"Tweet Sheet has been dismissed."); 
            }];
        });
    };
    
    NSString *confUbicado = navConferencias.title;
    
    //NSString *mensaje = @"Im just using the Amadeus app try it thats my score %@";
    NSString *mensaje01 = [NSString stringWithFormat:@"#RedESR estoy en la conferencia de %@", confUbicado];
    
    //  Set the initial body of the Tweet2
    [tweetSheet setInitialText:mensaje01]; 
    
    //  Adds an image to the Tweet
    //  For demo purposes, assume we have an image named 'larry.png'
    //  that we wish to attach
    
    //        if (![tweetSheet addImage:img.image]) 
    //        {
    
    
    
    
    //    if (![tweetSheet addImage:[UIImage imageNamed:img]]) {
    //        NSLog(@"Unable to add the image!");
    //    }
    
    //  Add an URL to the Tweet.  You can add multiple URLs.
    /* if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
     NSLog(@"Unable to add the URL!");
     }*/
    
    //  Presents the Tweet Sheet to the user
    [self presentViewController:tweetSheet animated:YES completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
    
    
    
}


-(IBAction)takePicture:(id)sender{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera; 
    [self presentModalViewController:picker animated:YES];    
    
}

//Recibe el mensaje cuando el controlador a finalizado.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //Quita la vista del controlador.
    [picker dismissModalViewControllerAnimated:YES];
    
    //Establece la imagen tomada en el objeto UIImageView.
    imagenFoto.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
}

-(IBAction)TweetFoto:(id)sender{
    
    //  Create an instance of the Tweet Sheet
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
    
    // Sets the completion handler.  Note that we don't know which thread the
    // block will be called on, so we need to ensure that any UI updates occur
    // on the main queue
    tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result) {
        switch(result) {
            case TWTweetComposeViewControllerResultCancelled:
                //  This means the user cancelled without sending the Tweet
                break;
            case TWTweetComposeViewControllerResultDone:
                //  This means the user hit 'Send'
                break;
        }
        
        
        //  dismiss the Tweet Sheet 
        dispatch_async(dispatch_get_main_queue(), ^{            
            [self dismissViewControllerAnimated:YES completion:^{
                NSLog(@"Tweet Sheet has been dismissed."); 
            }];
        });
    };
    
        
    //NSString *mensaje = @"Im just using the Amadeus app try it thats my score %@";
    NSString *mensaje01 = [NSString stringWithFormat:@"#REDESR"];
    
    //  Set the initial body of the Tweet2
    [tweetSheet setInitialText:mensaje01]; 
    
    //  Adds an image to the Tweet
    //  For demo purposes, assume we have an image named 'larry.png'
    //  that we wish to attach
    
            if (![tweetSheet addImage:imagenFoto.image]) 
            {
    
    
    
    
        if (![tweetSheet addImage:[UIImage imageNamed:imagenFoto]]) {
            NSLog(@"Unable to add the image!");
        }
            }
    
    //  Add an URL to the Tweet.  You can add multiple URLs.
    /* if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
     NSLog(@"Unable to add the URL!");
     }*/
    
    //  Presents the Tweet Sheet to the user
    [self presentViewController:tweetSheet animated:YES completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];

    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AgendarViewController *agendaEscene = [segue destinationViewController];
    
    if ([[segue identifier]isEqualToString:@"agendar"]) {
        
        agendaEscene.fechaInicial = labelFecha.text;
        agendaEscene.hora = labelHora.text;
        agendaEscene.conferencia = labelTemas.text;
        
    }
    
    
}

@end
