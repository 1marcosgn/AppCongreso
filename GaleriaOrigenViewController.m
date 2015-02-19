//
//  GaleriaOrigenViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GaleriaOrigenViewController.h"
#import "GaleriaDestinoViewController.h"
#import "TBXML.h"

@interface GaleriaOrigenViewController ()

@end

@implementation GaleriaOrigenViewController
@synthesize ligaOrigen,imagenOrigen;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //cambiar color Boton Back
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Atrás" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    backButton.tintColor = [UIColor brownColor];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    GaleriaDestinoViewController *galDestino = [segue destinationViewController];
    
    if ([[segue identifier]isEqualToString:@"registro"]) {
        
        galDestino.nombreNavegacion = @"Registro";
        galDestino.nombreImagen = @"registro.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo04" elementoNombreLiga:@"Enlace04" elementoNombreImagen:@"imagenEnlace04"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"inauguracion"]) {
        
        galDestino.nombreNavegacion = @"Inauguración";
        galDestino.nombreImagen = @"inaguracion.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo05" elementoNombreLiga:@"Enlace05" elementoNombreImagen:@"imagenEnlace05"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencias"]) {
        
        galDestino.nombreNavegacion = @"Conferencias";
        galDestino.nombreImagen = @"conferencias.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo06" elementoNombreLiga:@"Enlace06" elementoNombreImagen:@"imagenEnlace06"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"mejores"]) {
        
        galDestino.nombreNavegacion = @"Mejores Prácticas";
        galDestino.nombreImagen = @"mejores.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo07" elementoNombreLiga:@"Enlace07" elementoNombreImagen:@"imagenEnlace07"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"comida"]) {
        
        galDestino.nombreNavegacion = @"Comida";
        galDestino.nombreImagen = @"comida.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo08" elementoNombreLiga:@"Enlace08" elementoNombreImagen:@"imagenEnlace08"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"taller"]) {
        
        galDestino.nombreNavegacion = @"Taller RS";
        galDestino.nombreImagen = @"taller.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo09" elementoNombreLiga:@"Enlace09" elementoNombreImagen:@"imagenEnlace09"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"world"]) {
        
        galDestino.nombreNavegacion = @"World Cafe";
        galDestino.nombreImagen = @"world.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo10" elementoNombreLiga:@"Enlace10" elementoNombreImagen:@"imagenEnlace10"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"brindis"]) {
        
        galDestino.nombreNavegacion = @"Brindis";
        galDestino.nombreImagen = @"brindis.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo11" elementoNombreLiga:@"Enlace11" elementoNombreImagen:@"imagenEnlace11"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"panel"]) {
        
        galDestino.nombreNavegacion = @"Panel RSE";
        galDestino.nombreImagen = @"panel.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo12" elementoNombreLiga:@"Enlace12" elementoNombreImagen:@"imagenEnlace12"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"mesas"]) {
        
        galDestino.nombreNavegacion = @"Mesas Trabajo";
        galDestino.nombreImagen = @"mesas.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo13" elementoNombreLiga:@"Enlace13" elementoNombreImagen:@"imagenEnlace13"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"entrega"]) {
        
        galDestino.nombreNavegacion = @"Diplomas";
        galDestino.nombreImagen = @"diplomas.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo14" elementoNombreLiga:@"Enlace14" elementoNombreImagen:@"imagenEnlace14"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    if ([[segue identifier]isEqualToString:@"stands"]) {
        
        galDestino.nombreNavegacion = @"Stands";
        galDestino.nombreImagen = @"stands.png";
        
        //Carga Promo
        [self ObtenerLigaXML:@"Promo15" elementoNombreLiga:@"Enlace15" elementoNombreImagen:@"imagenEnlace15"];
        galDestino.destinoLiga = ligaOrigen;
        galDestino.destinoImagen = imagenOrigen;
        
    }
    
}


-(void)ObtenerLigaXML:(NSString *)elementoHijo elementoNombreLiga:(NSString *)elementoNombreLiga elementoNombreImagen:(NSString *)elementoNombreImagen{
    
    //Cadena Servicio
    NSString *cadenaServicio = @"http://fipade.com/fipade/images/servicios/promocion.xml";
    
    //Conversion XML
    TBXML *xml = [TBXML tbxmlWithURL:[NSURL URLWithString:cadenaServicio]];
    
    //Obteniendo  el Nodo Raiz
    TBXMLElement *rootXMLElement = xml.rootXMLElement;
    
    //Extracción de Elementos
    rootXMLElement = [TBXML childElementNamed:elementoHijo parentElement:rootXMLElement];
    
    //Nodos hijo
    NSString *ligaBanner = [TBXML textForElement:[TBXML childElementNamed:elementoNombreLiga parentElement:rootXMLElement]];
    
    NSString *imagenBanner = [TBXML textForElement:[TBXML childElementNamed:elementoNombreImagen parentElement:rootXMLElement]];
    
    
    ligaOrigen = ligaBanner;
    imagenOrigen = imagenBanner;
    
}


@end
