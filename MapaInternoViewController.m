//
//  MapaInternoViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapaInternoViewController.h"
#import "TBXML.h"

@interface MapaInternoViewController ()

@end

@implementation MapaInternoViewController
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
    [self ObtenerLigaXML];
    [self CargarImagen];
    
    [super viewDidLoad];
	
//    [scrollMapa setScrollEnabled:YES];
//    [scrollMapa setContentSize:CGSizeMake(400, 900)];
    
    
    
    
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


-(IBAction)MuestraInfo:(id)sender{
    
    actionInfo = [[UIActionSheet alloc] initWithTitle:@"Ubicaciones" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"01:Jardín de la Capilla", @"02:Gimnasio Auditorio", @"03:Sala Kino", @"04:Jardín Edificio B", @"05:Auditorio San Ignacio", nil];
    
    [actionInfo showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 1.0;}];
        
        [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 1.0;}];
        
        labelVistaDesc.text = @"En este bello Jardín podrá pasar un momento reconfortante mientras espera a que den inicio sus conferencias"; 
        labeVistaTitulo.text = @"Jardín de la Capilla";
        imageMapa.image = [UIImage imageNamed:@"01jardin.jpeg"];
        
    }
    
    if (buttonIndex == 1) {
        
        [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 1.0;}];
        [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 1.0;}];
        
        labelVistaDesc.text = @"Sede de las principales conferencias y dinámicas del evento"; 
        labeVistaTitulo.text = @"Gimnasio Auditorio";
        imageMapa.image = [UIImage imageNamed:@"02gimnasio.jpeg"];
        
        
        
    }
    
    if (buttonIndex == 2) {
        
        [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 1.0;}];
        [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 1.0;}];
        labelVistaDesc.text = @"En esta sala se llevarán a cabo paneles con la participación de los directores de los Medios Regionales"; 
        labeVistaTitulo.text = @"Sala Kino";
        imageMapa.image = [UIImage imageNamed:@"03salaKino.jpeg"];
        
    }
    
    if (buttonIndex == 3) {
        
        [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 1.0;}];
        [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 1.0;}];
        labelVistaDesc.text = @"Haga su estadía placentera paseando por estos amplios y agradables jardines"; 
        labeVistaTitulo.text = @"Jardín del Edificio B";
        imageMapa.image = [UIImage imageNamed:@"04.jpeg"];
        
        
    }
    
    if (buttonIndex == 4) {
        [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 1.0;}];
        [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 1.0;}];
        
        labelVistaDesc.text = @"Predestinado a ser una de las sedes de mayor afluencia para las conferencias de este magno evento"; 
        labeVistaTitulo.text = @"Auditorio San Ignacio";
        imageMapa.image = [UIImage imageNamed:@"05.jpeg"];
        
       
    }
    
}

-(IBAction)controlPan:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation = [recognizer translationInView:self.view];
    
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y); 
    
    [recognizer setTranslation:CGPointMake(0,0) inView:self.view];
    
}


-(IBAction)ocultaVista:(id)sender{
    
    [UIView animateWithDuration:0.4 animations:^(){vistaMapas.alpha = 0.0;}];
    [UIButton animateWithDuration:0.4 animations:^(){buttonClose.alpha = 0.0;}];
    
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
    rootXMLElement = [TBXML childElementNamed:@"Promo02" parentElement:rootXMLElement];
    
    //Nodos hijo
    NSString *ligaBanner = [TBXML textForElement:[TBXML childElementNamed:@"Enlace02" parentElement:rootXMLElement]];
    
    NSString *imagenBanner = [TBXML textForElement:[TBXML childElementNamed:@"imagenEnlace02" parentElement:rootXMLElement]];
    
    
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
