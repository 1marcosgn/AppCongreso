//
//  EmpresaViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EmpresaViewController.h"

@interface EmpresaViewController ()

@end

@implementation EmpresaViewController

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
	// Do any additional setup after loading the view.
    
    [self MostrarInfo];
    
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

-(void)MostrarInfo{
    
    [UIImageView animateWithDuration:2.4 animations:^(){imagenArrow.alpha = 1.0;}];
    [UILabel animateWithDuration:2.4 animations:^(){labelTouch.alpha = 1.0;}];
    
}

-(IBAction)EnviarCorreo:(id)sender{
    
    [self SendMail];
    
}

-(void)SendMail{ 
    
    if ([MFMailComposeViewController canSendMail]) {
        
        
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        
        mail.mailComposeDelegate = self;
        
        NSArray *arregloReceptor = [[NSArray alloc]initWithObjects:@"aplicaciones@fipade.info", nil];
        
        
        [mail setSubject:@"App Movil"];
        
        [mail setToRecipients:arregloReceptor];
        
        [mail setMessageBody:@"" isHTML:YES];
        
        [self presentModalViewController:mail animated:YES];
        
    }
    else {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Red ESR" message:@"Debes configurar tu dispositivo para enviar un email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        
    }

    
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissModalViewControllerAnimated:YES];
    
}

-(IBAction)OpenFipade:(id)sender{
    
    [self AbrirWeb:@"http://fipade.com/fipade/index.php?option=com_content&view=article&id=50&Itemid=57"];
    
}

-(void)AbrirWeb:(NSString *)pagina{
    
    NSURL *url = [ [ NSURL alloc ] initWithString: pagina ];
    
    [[UIApplication sharedApplication] openURL:url];
    
}

@end
