//
//  ContactoViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactoViewController.h"
#import "TBXML.h"

@interface ContactoViewController ()

@end

@implementation ContactoViewController
@synthesize ligaGlobal,imagenGlobal;

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
	
    [scrollCorreo setScrollEnabled:YES];
    [scrollCorreo setContentSize:CGSizeMake(50, 840)];
    
    [self ObtenerLigaXML];
    [self CargarImagen];

    
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



-(IBAction)EnviarCorreo:(id)sender{
    
    if ([textEmail.text isEqualToString:@""] || [textAsunto.text isEqualToString:@""] || [textMensaje.text isEqualToString:@""] || [textNombre.text isEqualToString:@""] ) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Red ESR" message:@"Debes completar todos los campos para poder enviar tu correo" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        
        [alert show];
        
    }
    else {
        
        [self SendMail];
        
    }
    
    
    
}

-(void)SendMail{ 
    
    if ([MFMailComposeViewController canSendMail]) {
    
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        
        mail.mailComposeDelegate = self;
        
        NSString *nombreApellido = textNombre.text;
        NSString *email = textEmail.text;
        NSString *asunto = textAsunto.text;
        NSString *mensaje = textMensaje.text;
        NSArray *arregloReceptor = [[NSArray alloc]initWithObjects:@"info@redesrlaguna.org", nil];
        
        NSString *CadenaCompleta = [NSString stringWithFormat:@"Hola mi nombre es %@, este es mi mensaje para la Red: %@. email:%@", nombreApellido,mensaje,email];
        
        [mail setSubject:asunto];
        
        [mail setToRecipients:arregloReceptor];
        
        [mail setMessageBody:CadenaCompleta isHTML:YES];
        
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


-(IBAction)OcultarTextoMensaje:(id)sender{
    [textMensaje resignFirstResponder];
}
-(IBAction)Ocultarteclado:(id)sender{

}

#pragma mark - Promocion

-(void)ObtenerLigaXML{
    
    //Cadena Servicio
    NSString *cadenaServicio = @"http://fipade.com/fipade/images/servicios/promocion.xml";
    
    //Conversion XML
    TBXML *xml = [TBXML tbxmlWithURL:[NSURL URLWithString:cadenaServicio]];
    
    //Obteniendo  el Nodo Raiz
    TBXMLElement *rootXMLElement = xml.rootXMLElement;
    
    //Extracción de Elementos
    rootXMLElement = [TBXML childElementNamed:@"Promo03" parentElement:rootXMLElement];
    
    //Nodos hijo
    NSString *ligaBanner = [TBXML textForElement:[TBXML childElementNamed:@"Enlace03" parentElement:rootXMLElement]];
    
    NSString *imagenBanner = [TBXML textForElement:[TBXML childElementNamed:@"imagenEnlace03" parentElement:rootXMLElement]];
    
    
    ligaGlobal = ligaBanner;
    imagenGlobal = imagenBanner;
    
}

-(void)CargarImagen{
    
    NSURL *urlone= [NSURL URLWithString:imagenGlobal];
    
    NSData *new=[NSData dataWithContentsOfURL:urlone];
    
    [buttonBanner setBackgroundImage:[UIImage imageWithData:new]forState:UIControlStateNormal];
    
}


-(IBAction)CargarBanner:(id)sender{
    
    NSURL *url = [ [ NSURL alloc ] initWithString: ligaGlobal ];
    
    [[UIApplication sharedApplication] openURL:url];
    
}

@end
