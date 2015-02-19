//
//  CroquisViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CroquisViewController.h"
#import "TBXML.h"

@interface CroquisViewController ()

@end

@implementation CroquisViewController



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

#pragma mark - Codigo para Promocion

NSString *ligaGlobal = @"";
NSString *imagenGlobal = @"";

-(void)ObtenerLigaXML{
    
    //Cadena Servicio
    NSString *cadenaServicio = @"http://fipade.com/fipade/images/servicios/promocion.xml";
    
    //Conversion XML
    TBXML *xml = [TBXML tbxmlWithURL:[NSURL URLWithString:cadenaServicio]];
    
    //Obteniendo  el Nodo Raiz
    TBXMLElement *rootXMLElement = xml.rootXMLElement;
    
    //Extracción de Elementos
    rootXMLElement = [TBXML childElementNamed:@"Promo01" parentElement:rootXMLElement];
    
    //Nodos hijo
    NSString *ligaBanner = [TBXML textForElement:[TBXML childElementNamed:@"Enlace01" parentElement:rootXMLElement]];
    
    NSString *imagenBanner = [TBXML textForElement:[TBXML childElementNamed:@"imagenEnlace01" parentElement:rootXMLElement]];
    
    
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
