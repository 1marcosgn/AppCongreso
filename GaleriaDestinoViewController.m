//
//  GaleriaDestinoViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GaleriaDestinoViewController.h"

@interface GaleriaDestinoViewController ()

@end

@implementation GaleriaDestinoViewController

@synthesize nombreImagen,nombreNavegacion;
@synthesize destinoLiga,destinoImagen;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    navBar.title = nombreNavegacion;
    imagenGaleria.image = [UIImage imageNamed:nombreImagen];
    labelDescripcion.text = nombreNavegacion;
    
    
    //Carga la imagen al boton
    NSURL *urlone= [NSURL URLWithString:destinoImagen];
    
    NSData *new=[NSData dataWithContentsOfURL:urlone];
    
    [buttonBanner setBackgroundImage:[UIImage imageWithData:new]forState:UIControlStateNormal];
    
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
    
    if (![tweetSheet addImage:imagenGaleria.image]) 
    {
        
        
        
        
        if (![tweetSheet addImage:[UIImage imageNamed:imagenGaleria]]) {
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


-(IBAction)CargarBanner:(id)sender{
    
    [self abrirEnlace:destinoLiga];
    
}

-(void)abrirEnlace:(NSString *)liga{
    
    
    NSURL *url = [ [ NSURL alloc ] initWithString: liga ];
    
    [[UIApplication sharedApplication] openURL:url];
    
}

@end
