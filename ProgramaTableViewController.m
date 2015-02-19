//
//  ProgramaTableViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgramaTableViewController.h"
#import "ConferenciasViewController.h"
#import "TBXML.h" 

@interface ProgramaTableViewController ()

@end

@implementation ProgramaTableViewController

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
    
    
    //Verificamos si existe una conexión a Iternet
    
    if (![self estaConectado]) {
        
        UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Red ESR" message:@"Es posible que algunas de las características no estén disponibles en este dispositivo sin una conexión a Internet" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alerta show];
        
    }
    else {
        
        [self ObtenerDatosConferencias];
        
        [self MostrarInfo];

    }
        
        
}


-(BOOL)estaConectado{
    
    Reachability *accesibilidad = [Reachability reachabilityForInternetConnection];
    NetworkStatus estadoRed = [accesibilidad currentReachabilityStatus];
    return !(estadoRed == NotReachable);
    
}

-(void)ObtenerDatosConferencias{
    
    NSString *cadenaConferencia;
    
    for (int i = 1; i < 29; i++) {
        
        if (i<10) {
            
            cadenaConferencia = [NSString stringWithFormat:@"Conferencia0%d",i];
            
        }
        else {
            cadenaConferencia = [NSString stringWithFormat:@"Conferencia%d",i];
        }
        
        
        [self CargarXML:cadenaConferencia :i];
        
    }
    
}

-(void)MostrarInfo{
    
    labelConferencia01.text = nombreConferencia01;
    labelHora01.text = hora01;
    
    labelConferencia02.text = nombreConferencia02;
    labelHora02.text = hora02;
    
    labelConferencia03.text = nombreConferencia03;
    labelHora03.text = hora03;
    
    labelConferencia04.text = nombreConferencia04;
    labelHora04.text = hora04;
    
    labelConferencia05.text = nombreConferencia05;
    labelHora05.text = hora05;
    
    labelConferencia06.text = nombreConferencia06;
    labelHora06.text = hora06;
    
    labelConferencia07.text = nombreConferencia07;
    labelHora07.text = hora07;
    
    labelConferencia08.text = nombreConferencia08;
    labelHora08.text = hora08;
    
    labelConferencia09.text = nombreConferencia09;
    labelHora09.text = hora09;
    
    labelConferencia10.text = nombreConferencia10;
    labelHora10.text = hora10;
    
    labelConferencia11.text = nombreConferencia11;
    labelHora11.text = hora11;
    
    labelConferencia12.text = nombreConferencia12;
    labelHora12.text = hora12;
    
    labelConferencia13.text = nombreConferencia13;
    labelHora13.text = hora13;
    
    labelConferencia14.text = nombreConferencia14;
    labelHora14.text = hora14;
    
    labelConferencia15.text = nombreConferencia15;
    labelHora15.text = hora15;
    
    labelConferencia16.text = nombreConferencia16;
    labelHora16.text = hora16;
    
    labelConferencia17.text = nombreConferencia17;
    labelHora17.text = hora17;
    
    labelConferencia18.text = nombreConferencia18;
    labelHora18.text = hora18;
    
    labelConferencia19.text = nombreConferencia19;
    labelHora19.text = hora19;
    
    labelConferencia20.text = nombreConferencia20;
    labelHora20.text = hora20;
    
    labelConferencia21.text = nombreConferencia21;
    labelHora21.text = hora21;
    
    labelConferencia22.text = nombreConferencia22;
    labelHora22.text = hora22;
    
    labelConferencia23.text = nombreConferencia23;
    labelHora23.text = hora23;
    
    labelConferencia24.text = nombreConferencia24;
    labelHora24.text = hora24;
    
    labelConferencia25.text = nombreConferencia25;
    labelHora25.text = hora25;
    
    labelConferencia26.text = nombreConferencia26;
    labelHora26.text = hora26;
    
    labelConferencia27.text = nombreConferencia27;
    labelHora27.text = hora27;
    
    labelConferencia28.text = nombreConferencia28;
    labelHora28.text = hora28;
    
    
}

-(void)CargarXML:(NSString *)Conferencia:(int)numeroConferencia{
    
    //Cadena Servicio
    NSString *cadenaServicio = @"http://fipade.com/fipade/images/servicios/red.xml";
    
    //Conversion XML
    TBXML *xml = [TBXML tbxmlWithURL:[NSURL URLWithString:cadenaServicio]];
    
    //Obteniendo  el Nodo Raiz
    TBXMLElement *rootXMLElement = xml.rootXMLElement;
    
    //Extracción de Elementos
    rootXMLElement = [TBXML childElementNamed:Conferencia parentElement:rootXMLElement];
    
    //Nodos hijo
    NSString *infoConferencia = [TBXML textForElement:[TBXML childElementNamed:@"NombreConferencia" parentElement:rootXMLElement]];
    
    NSString *infoConferencista = [TBXML textForElement:[TBXML childElementNamed:@"NombreConferencista" parentElement:rootXMLElement]];
    
    NSString *infoHora = [TBXML textForElement:[TBXML childElementNamed:@"Hora" parentElement:rootXMLElement]];
    NSString *infoTemas = [TBXML textForElement:[TBXML childElementNamed:@"Temas" parentElement:rootXMLElement]];
    NSString *infoFecha = [TBXML textForElement:[TBXML childElementNamed:@"Fecha" parentElement:rootXMLElement]];
    NSString *infoDireccion = [TBXML textForElement:[TBXML childElementNamed:@"Direccion" parentElement:rootXMLElement]];
    NSString *infoCiudadEstado = [TBXML textForElement:[TBXML childElementNamed:@"CiudadEstado" parentElement:rootXMLElement]];
    NSString *infoLatitud = [TBXML textForElement:[TBXML childElementNamed:@"Latitud" parentElement:rootXMLElement]];
    NSString *infoLongitud = [TBXML textForElement:[TBXML childElementNamed:@"Longitud" parentElement:rootXMLElement]];
    NSString *infoAbrevia = [TBXML textForElement:[TBXML childElementNamed:@"Abrevia" parentElement:rootXMLElement]];
    
    
    
    switch (numeroConferencia) {
            
        case 1:
            
            conferencista01 = infoConferencista;
            nombreConferencia01 = infoConferencia;
            hora01 = infoHora;
            tema01 = infoTemas;
            fecha01 = infoFecha;
            direccion01 = infoDireccion;
            ciudadEstado01 = infoCiudadEstado;
            latitud01 = infoLatitud;
            longitud01 = infoLongitud;
            Abrevia01 = infoAbrevia;
            
            break;
        
        case 2:
            
            conferencista02 = infoConferencista;
            nombreConferencia02 = infoConferencia;
            hora02 = infoHora;
            tema02 = infoTemas;
            fecha02 = infoFecha;
            direccion02 = infoDireccion;
            ciudadEstado02 = infoCiudadEstado;
            latitud02 = infoLatitud;
            longitud02 = infoLongitud;
            Abrevia02 = infoAbrevia;
            
            break;
            
        case 3:
            
            conferencista03 = infoConferencista;
            nombreConferencia03 = infoConferencia;
            hora03 = infoHora;
            tema03 = infoTemas;
            fecha03 = infoFecha;
            direccion03 = infoDireccion;
            ciudadEstado03 = infoCiudadEstado;
            latitud03 = infoLatitud;
            longitud03 = infoLongitud;
            Abrevia03 = infoAbrevia;
            
            break;
            
        case 4:
            
            conferencista04 = infoConferencista;
            nombreConferencia04 = infoConferencia;
            hora04 = infoHora;
            tema04 = infoTemas;
            fecha04 = infoFecha;
            direccion04 = infoDireccion;
            ciudadEstado04 = infoCiudadEstado;
            latitud04 = infoLatitud;
            longitud04 = infoLongitud;
            Abrevia04 = infoAbrevia;
            
            break;
            
            
        case 5:
            
            conferencista05 = infoConferencista;
            nombreConferencia05 = infoConferencia;
            hora05 = infoHora;
            tema05 = infoTemas;
            fecha05 = infoFecha;
            direccion05 = infoDireccion;
            ciudadEstado05 = infoCiudadEstado;
            latitud05 = infoLatitud;
            longitud05 = infoLongitud;
            Abrevia05 = infoAbrevia;
            
            break;
            
        case 6:
            
            conferencista06 = infoConferencista;
            nombreConferencia06 = infoConferencia;
            hora06 = infoHora;
            tema06 = infoTemas;
            fecha06 = infoFecha;
            direccion06 = infoDireccion;
            ciudadEstado06 = infoCiudadEstado;
            latitud06 = infoLatitud;
            longitud06 = infoLongitud;
            Abrevia06 = infoAbrevia;
            
            break;
            
        case 7:
            
            conferencista07 = infoConferencista;
            nombreConferencia07 = infoConferencia;
            hora07 = infoHora;
            tema07 = infoTemas;
            fecha07 = infoFecha;
            direccion07 = infoDireccion;
            ciudadEstado07 = infoCiudadEstado;
            latitud07 = infoLatitud;
            longitud07 = infoLongitud;
            Abrevia07 = infoAbrevia;
            
            break;
            
        case 8:
            
            conferencista08 = infoConferencista;
            nombreConferencia08 = infoConferencia;
            hora08 = infoHora;
            tema08 = infoTemas;
            fecha08 = infoFecha;
            direccion08 = infoDireccion;
            ciudadEstado08 = infoCiudadEstado;
            latitud08 = infoLatitud;
            longitud08 = infoLongitud;
            Abrevia08 = infoAbrevia;
            
            break;
            
        case 9:
            
            conferencista09 = infoConferencista;
            nombreConferencia09 = infoConferencia;
            hora09 = infoHora;
            tema09 = infoTemas;
            fecha09 = infoFecha;
            direccion09 = infoDireccion;
            ciudadEstado09 = infoCiudadEstado;
            latitud09 = infoLatitud;
            longitud09 = infoLongitud;
            Abrevia09 = infoAbrevia;
            
            break;
            
        case 10:
            
            conferencista10 = infoConferencista;
            nombreConferencia10 = infoConferencia;
            hora10 = infoHora;
            tema10 = infoTemas;
            fecha10 = infoFecha;
            direccion10 = infoDireccion;
            ciudadEstado10 = infoCiudadEstado;
            latitud10 = infoLatitud;
            longitud10 = infoLongitud;
            Abrevia10 = infoAbrevia;
            
            break;
            
        case 11:
            
            conferencista11 = infoConferencista;
            nombreConferencia11 = infoConferencia;
            hora11 = infoHora;
            tema11 = infoTemas;
            fecha11 = infoFecha;
            direccion11 = infoDireccion;
            ciudadEstado11 = infoCiudadEstado;
            latitud11 = infoLatitud;
            longitud11 = infoLongitud;
            Abrevia11 = infoAbrevia;
            
            break;
            
        case 12:
            
            conferencista12 = infoConferencista;
            nombreConferencia12 = infoConferencia;
            hora12 = infoHora;
            tema12 = infoTemas;
            fecha12 = infoFecha;
            direccion12 = infoDireccion;
            ciudadEstado12 = infoCiudadEstado;
            latitud12 = infoLatitud;
            longitud12 = infoLongitud;
            Abrevia12 = infoAbrevia;
            
            break;
            
        case 13:
            
            conferencista13 = infoConferencista;
            nombreConferencia13 = infoConferencia;
            hora13 = infoHora;
            tema13 = infoTemas;
            fecha13 = infoFecha;
            direccion13 = infoDireccion;
            ciudadEstado13 = infoCiudadEstado;
            latitud13 = infoLatitud;
            longitud13 = infoLongitud;
            Abrevia13 = infoAbrevia;
            
            break;
            
        case 14:
            
            conferencista14 = infoConferencista;
            nombreConferencia14 = infoConferencia;
            hora14 = infoHora;
            tema14 = infoTemas;
            fecha14 = infoFecha;
            direccion14 = infoDireccion;
            ciudadEstado14 = infoCiudadEstado;
            latitud14 = infoLatitud;
            longitud14 = infoLongitud;
            Abrevia14 = infoAbrevia;
            
            break;
            
        case 15:
            
            conferencista15 = infoConferencista;
            nombreConferencia15 = infoConferencia;
            hora15 = infoHora;
            tema15 = infoTemas;
            fecha15 = infoFecha;
            direccion15 = infoDireccion;
            ciudadEstado15 = infoCiudadEstado;
            latitud15 = infoLatitud;
            longitud15 = infoLongitud;
            Abrevia15 = infoAbrevia;
            
            break;
            
        case 16:
            
            conferencista16 = infoConferencista;
            nombreConferencia16 = infoConferencia;
            hora16 = infoHora;
            tema16 = infoTemas;
            fecha16 = infoFecha;
            direccion16 = infoDireccion;
            ciudadEstado16 = infoCiudadEstado;
            latitud16 = infoLatitud;
            longitud16 = infoLongitud;
            Abrevia16 = infoAbrevia;
            
            break;
            
        case 17:
            
            conferencista17 = infoConferencista;
            nombreConferencia17 = infoConferencia;
            hora17 = infoHora;
            tema17 = infoTemas;
            fecha17 = infoFecha;
            direccion17 = infoDireccion;
            ciudadEstado17 = infoCiudadEstado;
            latitud17 = infoLatitud;
            longitud17 = infoLongitud;
            Abrevia17 = infoAbrevia;
            
            break;
            
        case 18:
            
            conferencista18 = infoConferencista;
            nombreConferencia18 = infoConferencia;
            hora18 = infoHora;
            tema18 = infoTemas;
            fecha18 = infoFecha;
            direccion18 = infoDireccion;
            ciudadEstado18 = infoCiudadEstado;
            latitud18 = infoLatitud;
            longitud18 = infoLongitud;
            Abrevia18 = infoAbrevia;
            
            break;
            
        case 19:
            
            conferencista19 = infoConferencista;
            nombreConferencia19 = infoConferencia;
            hora19 = infoHora;
            tema19 = infoTemas;
            fecha19 = infoFecha;
            direccion19 = infoDireccion;
            ciudadEstado19 = infoCiudadEstado;
            latitud19 = infoLatitud;
            longitud19 = infoLongitud;
            Abrevia19 = infoAbrevia;
            
            break;
            
        case 20:
            
            conferencista20 = infoConferencista;
            nombreConferencia20 = infoConferencia;
            hora20 = infoHora;
            tema20 = infoTemas;
            fecha20 = infoFecha;
            direccion20 = infoDireccion;
            ciudadEstado20 = infoCiudadEstado;
            latitud20 = infoLatitud;
            longitud20 = infoLongitud;
            Abrevia20 = infoAbrevia;
            
            break;
            
        case 21:
            
            conferencista21 = infoConferencista;
            nombreConferencia21 = infoConferencia;
            hora21 = infoHora;
            tema21 = infoTemas;
            fecha21 = infoFecha;
            direccion21 = infoDireccion;
            ciudadEstado21 = infoCiudadEstado;
            latitud21 = infoLatitud;
            longitud21 = infoLongitud;
            Abrevia21 = infoAbrevia;
            
            break;
            
        case 22:
            
            conferencista22 = infoConferencista;
            nombreConferencia22 = infoConferencia;
            hora22 = infoHora;
            tema22 = infoTemas;
            fecha22 = infoFecha;
            direccion22 = infoDireccion;
            ciudadEstado22 = infoCiudadEstado;
            latitud22 = infoLatitud;
            longitud22 = infoLongitud;
            Abrevia22 = infoAbrevia;
            
            break;
            
        case 23:
            
            conferencista23 = infoConferencista;
            nombreConferencia23 = infoConferencia;
            hora23 = infoHora;
            tema23 = infoTemas;
            fecha23 = infoFecha;
            direccion23 = infoDireccion;
            ciudadEstado23 = infoCiudadEstado;
            latitud23 = infoLatitud;
            longitud23 = infoLongitud;
            Abrevia23 = infoAbrevia;
            
            break;
            
        case 24:
            
            conferencista24 = infoConferencista;
            nombreConferencia24 = infoConferencia;
            hora24 = infoHora;
            tema24 = infoTemas;
            fecha24 = infoFecha;
            direccion24 = infoDireccion;
            ciudadEstado24 = infoCiudadEstado;
            latitud24 = infoLatitud;
            longitud24 = infoLongitud;
            Abrevia24 = infoAbrevia;
            
            break;
            
        case 25:
            
            conferencista25 = infoConferencista;
            nombreConferencia25 = infoConferencia;
            hora25 = infoHora;
            tema25 = infoTemas;
            fecha25 = infoFecha;
            direccion25 = infoDireccion;
            ciudadEstado25 = infoCiudadEstado;
            latitud25 = infoLatitud;
            longitud25 = infoLongitud;
            Abrevia25 = infoAbrevia;
            
            break;
            
        case 26:
            
            conferencista26 = infoConferencista;
            nombreConferencia26 = infoConferencia;
            hora26 = infoHora;
            tema26 = infoTemas;
            fecha26 = infoFecha;
            direccion26 = infoDireccion;
            ciudadEstado26 = infoCiudadEstado;
            latitud26 = infoLatitud;
            longitud26 = infoLongitud;
            Abrevia26 = infoAbrevia;
            
            break;
            
        case 27:
            
            conferencista27 = infoConferencista;
            nombreConferencia27 = infoConferencia;
            hora27 = infoHora;
            tema27 = infoTemas;
            fecha27 = infoFecha;
            direccion27 = infoDireccion;
            ciudadEstado27 = infoCiudadEstado;
            latitud27 = infoLatitud;
            longitud27 = infoLongitud;
            Abrevia27 = infoAbrevia;
            
            break;
            
        case 28:
            
            conferencista28 = infoConferencista;
            nombreConferencia28 = infoConferencia;
            hora28 = infoHora;
            tema28 = infoTemas;
            fecha28 = infoFecha;
            direccion28 = infoDireccion;
            ciudadEstado28 = infoCiudadEstado;
            latitud28 = infoLatitud;
            longitud28 = infoLongitud;
            Abrevia28 = infoAbrevia;
            
            break;
            
        
        
        
        default:
            break;
    }


      
    
    
    
}

//Variables Globales
//Nombre Conferencias
NSString *nombreConferencia01;
NSString *nombreConferencia02;
NSString *nombreConferencia03;
NSString *nombreConferencia04;
NSString *nombreConferencia05;
NSString *nombreConferencia06;
NSString *nombreConferencia07;
NSString *nombreConferencia08;
NSString *nombreConferencia09;
NSString *nombreConferencia10;
NSString *nombreConferencia11;
NSString *nombreConferencia12;
NSString *nombreConferencia13;
NSString *nombreConferencia14;
NSString *nombreConferencia15;
NSString *nombreConferencia16;
NSString *nombreConferencia17;
NSString *nombreConferencia18;
NSString *nombreConferencia19;
NSString *nombreConferencia20;
NSString *nombreConferencia21;
NSString *nombreConferencia22;
NSString *nombreConferencia23;
NSString *nombreConferencia24;
NSString *nombreConferencia25;
NSString *nombreConferencia26;
NSString *nombreConferencia27;
NSString *nombreConferencia28;

//Conferencistas
NSString *conferencista01;
NSString *conferencista02;
NSString *conferencista03;
NSString *conferencista04;
NSString *conferencista05;
NSString *conferencista06;
NSString *conferencista07;
NSString *conferencista08;
NSString *conferencista09;
NSString *conferencista10;
NSString *conferencista11;
NSString *conferencista12;
NSString *conferencista13;
NSString *conferencista14;
NSString *conferencista15;
NSString *conferencista16;
NSString *conferencista17;
NSString *conferencista18;
NSString *conferencista19;
NSString *conferencista20;
NSString *conferencista21;
NSString *conferencista22;
NSString *conferencista23;
NSString *conferencista24;
NSString *conferencista25;
NSString *conferencista26;
NSString *conferencista27;
NSString *conferencista28;

//Hora
NSString *hora01;
NSString *hora02;
NSString *hora03;
NSString *hora04;
NSString *hora05;
NSString *hora06;
NSString *hora07;
NSString *hora08;
NSString *hora09;
NSString *hora10;
NSString *hora11;
NSString *hora12;
NSString *hora13;
NSString *hora14;
NSString *hora15;
NSString *hora16;
NSString *hora17;
NSString *hora18;
NSString *hora19;
NSString *hora20;
NSString *hora21;
NSString *hora22;
NSString *hora23;
NSString *hora24;
NSString *hora25;
NSString *hora26;
NSString *hora27;
NSString *hora28;
NSString *hora29;
NSString *hora30;

//Temas
NSString *tema01;
NSString *tema02;
NSString *tema03;
NSString *tema04;
NSString *tema05;
NSString *tema06;
NSString *tema07;
NSString *tema08;
NSString *tema09;
NSString *tema10;
NSString *tema11;
NSString *tema12;
NSString *tema13;
NSString *tema14;
NSString *tema15;
NSString *tema16;
NSString *tema17;
NSString *tema18;
NSString *tema19;
NSString *tema20;
NSString *tema21;
NSString *tema22;
NSString *tema23;
NSString *tema24;
NSString *tema25;
NSString *tema26;
NSString *tema27;
NSString *tema28;

//Fecha
NSString *fecha01;
NSString *fecha02;
NSString *fecha03;
NSString *fecha04;
NSString *fecha05;
NSString *fecha06;
NSString *fecha07;
NSString *fecha08;
NSString *fecha09;
NSString *fecha10;
NSString *fecha11;
NSString *fecha12;
NSString *fecha13;
NSString *fecha14;
NSString *fecha15;
NSString *fecha16;
NSString *fecha17;
NSString *fecha18;
NSString *fecha19;
NSString *fecha20;
NSString *fecha21;
NSString *fecha22;
NSString *fecha23;
NSString *fecha24;
NSString *fecha25;
NSString *fecha26;
NSString *fecha27;
NSString *fecha28;

//Direccion
NSString *direccion01;
NSString *direccion02;
NSString *direccion03;
NSString *direccion04;
NSString *direccion05;
NSString *direccion06;
NSString *direccion07;
NSString *direccion08;
NSString *direccion09;
NSString *direccion10;
NSString *direccion11;
NSString *direccion12;
NSString *direccion13;
NSString *direccion14;
NSString *direccion15;
NSString *direccion16;
NSString *direccion17;
NSString *direccion18;
NSString *direccion19;
NSString *direccion20;
NSString *direccion21;
NSString *direccion22;
NSString *direccion23;
NSString *direccion24;
NSString *direccion25;
NSString *direccion26;
NSString *direccion27;
NSString *direccion28;

//CiudadEstado
NSString *ciudadEstado01;
NSString *ciudadEstado02;
NSString *ciudadEstado03;
NSString *ciudadEstado04;
NSString *ciudadEstado05;
NSString *ciudadEstado06;
NSString *ciudadEstado07;
NSString *ciudadEstado08;
NSString *ciudadEstado09;
NSString *ciudadEstado10;
NSString *ciudadEstado11;
NSString *ciudadEstado12;
NSString *ciudadEstado13;
NSString *ciudadEstado14;
NSString *ciudadEstado15;
NSString *ciudadEstado16;
NSString *ciudadEstado17;
NSString *ciudadEstado18;
NSString *ciudadEstado19;
NSString *ciudadEstado20;
NSString *ciudadEstado21;
NSString *ciudadEstado22;
NSString *ciudadEstado23;
NSString *ciudadEstado24;
NSString *ciudadEstado25;
NSString *ciudadEstado26;
NSString *ciudadEstado27;
NSString *ciudadEstado28;

//Latitud
NSString *latitud01;
NSString *latitud02;
NSString *latitud03;
NSString *latitud04;
NSString *latitud05;
NSString *latitud06;
NSString *latitud07;
NSString *latitud08;
NSString *latitud09;
NSString *latitud10;
NSString *latitud11;
NSString *latitud12;
NSString *latitud13;
NSString *latitud14;
NSString *latitud15;
NSString *latitud16;
NSString *latitud17;
NSString *latitud18;
NSString *latitud19;
NSString *latitud20;
NSString *latitud21;
NSString *latitud22;
NSString *latitud23;
NSString *latitud24;
NSString *latitud25;
NSString *latitud26;
NSString *latitud27;
NSString *latitud28;

//Longitud
NSString *longitud01;
NSString *longitud02;
NSString *longitud03;
NSString *longitud04;
NSString *longitud05;
NSString *longitud06;
NSString *longitud07;
NSString *longitud08;
NSString *longitud09;
NSString *longitud10;
NSString *longitud11;
NSString *longitud12;
NSString *longitud13;
NSString *longitud14;
NSString *longitud15;
NSString *longitud16;
NSString *longitud17;
NSString *longitud18;
NSString *longitud19;
NSString *longitud20;
NSString *longitud21;
NSString *longitud22;
NSString *longitud23;
NSString *longitud24;
NSString *longitud25;
NSString *longitud26;
NSString *longitud27;
NSString *longitud28;

//Abrevia 
NSString *Abrevia01;
NSString *Abrevia02;
NSString *Abrevia03;
NSString *Abrevia04;
NSString *Abrevia05;
NSString *Abrevia06;
NSString *Abrevia07;
NSString *Abrevia08;
NSString *Abrevia09;
NSString *Abrevia10;
NSString *Abrevia11;
NSString *Abrevia12;
NSString *Abrevia13;
NSString *Abrevia14;
NSString *Abrevia15;
NSString *Abrevia16;
NSString *Abrevia17;
NSString *Abrevia18;
NSString *Abrevia19;
NSString *Abrevia20;
NSString *Abrevia21;
NSString *Abrevia22;
NSString *Abrevia23;
NSString *Abrevia24;
NSString *Abrevia25;
NSString *Abrevia26;
NSString *Abrevia27;
NSString *Abrevia28;


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
    
    ConferenciasViewController *claseConferencias = [segue destinationViewController];
        
    if ([[segue identifier]isEqualToString:@"conferencia01"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia01.text;
        claseConferencias.propAbrevia = @"Inauguración";
        claseConferencias.propCiudadEstado = ciudadEstado01;
        claseConferencias.propConferencista = conferencista01;
        claseConferencias.propDireccion = direccion01;
        claseConferencias.propFecha = fecha01;
        claseConferencias.propHora = hora01;
        claseConferencias.propLatitud = latitud01;
        claseConferencias.propLongitud = longitud01;
        claseConferencias.propTemas = tema01;
        
    }
    
    if ([[segue identifier]isEqualToString:@"conferencia03"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia03.text;
        
        claseConferencias.propAbrevia = Abrevia03;
        claseConferencias.propCiudadEstado = ciudadEstado03;
        claseConferencias.propConferencista = conferencista03;
        claseConferencias.propDireccion = direccion03;
        claseConferencias.propFecha = fecha03;
        claseConferencias.propHora = hora03;
        claseConferencias.propLatitud = latitud03;
        claseConferencias.propLongitud = longitud03;
        claseConferencias.propTemas = nombreConferencia03;
        
                
    }
    
    //::::::::::::::::::::::::::::::::::::::::::::::::
    if ([[segue identifier]isEqualToString:@"conferencia04"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia04.text;
        
        claseConferencias.propAbrevia = Abrevia04;
        claseConferencias.propCiudadEstado = ciudadEstado04;
        claseConferencias.propConferencista = conferencista04;
        claseConferencias.propDireccion = direccion04;
        claseConferencias.propFecha = fecha04;
        claseConferencias.propHora = hora04;
        claseConferencias.propLatitud = latitud04;
        claseConferencias.propLongitud = longitud04;
        claseConferencias.propTemas = nombreConferencia04;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia05"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia05.text;
        
        claseConferencias.propAbrevia = Abrevia05;
        claseConferencias.propCiudadEstado = ciudadEstado05;
        claseConferencias.propConferencista = conferencista05;
        claseConferencias.propDireccion = direccion05;
        claseConferencias.propFecha = fecha05;
        claseConferencias.propHora = hora05;
        claseConferencias.propLatitud = latitud05;
        claseConferencias.propLongitud = longitud05;
        claseConferencias.propTemas = nombreConferencia05;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia06"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia06.text;
        
        claseConferencias.propAbrevia = Abrevia06;
        claseConferencias.propCiudadEstado = ciudadEstado06;
        claseConferencias.propConferencista = conferencista06;
        claseConferencias.propDireccion = direccion06;
        claseConferencias.propFecha = fecha06;
        claseConferencias.propHora = hora06;
        claseConferencias.propLatitud = latitud06;
        claseConferencias.propLongitud = longitud06;
        claseConferencias.propTemas = nombreConferencia06;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia07"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia07.text;
        
        claseConferencias.propAbrevia = Abrevia07;
        claseConferencias.propCiudadEstado = ciudadEstado07;
        claseConferencias.propConferencista = conferencista07;
        claseConferencias.propDireccion = direccion07;
        claseConferencias.propFecha = fecha07;
        claseConferencias.propHora = hora07;
        claseConferencias.propLatitud = latitud07;
        claseConferencias.propLongitud = longitud07;
        claseConferencias.propTemas = nombreConferencia07;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia08"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia08.text;
        
        claseConferencias.propAbrevia = Abrevia08;
        claseConferencias.propCiudadEstado = ciudadEstado08;
        claseConferencias.propConferencista = conferencista08;
        claseConferencias.propDireccion = direccion08;
        claseConferencias.propFecha = fecha08;
        claseConferencias.propHora = hora08;
        claseConferencias.propLatitud = latitud08;
        claseConferencias.propLongitud = longitud08;
        claseConferencias.propTemas = nombreConferencia08;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia09"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia09.text;
        
        claseConferencias.propAbrevia = Abrevia09;
        claseConferencias.propCiudadEstado = ciudadEstado09;
        claseConferencias.propConferencista = conferencista09;
        claseConferencias.propDireccion = direccion09;
        claseConferencias.propFecha = fecha09;
        claseConferencias.propHora = hora09;
        claseConferencias.propLatitud = latitud09;
        claseConferencias.propLongitud = longitud09;
        claseConferencias.propTemas = nombreConferencia09;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia10"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia10.text;
        
        claseConferencias.propAbrevia = Abrevia10;
        claseConferencias.propCiudadEstado = ciudadEstado10;
        claseConferencias.propConferencista = conferencista10;
        claseConferencias.propDireccion = direccion10;
        claseConferencias.propFecha = fecha10;
        claseConferencias.propHora = hora10;
        claseConferencias.propLatitud = latitud10;
        claseConferencias.propLongitud = longitud10;
        claseConferencias.propTemas = nombreConferencia10;
        
    }
    
    if ([[segue identifier]isEqualToString:@"conferencia11"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia11.text;
        
        claseConferencias.propAbrevia = Abrevia11;
        claseConferencias.propCiudadEstado = ciudadEstado11;
        claseConferencias.propConferencista = conferencista11;
        claseConferencias.propDireccion = direccion11;
        claseConferencias.propFecha = fecha11;
        claseConferencias.propHora = hora11;
        claseConferencias.propLatitud = latitud11;
        claseConferencias.propLongitud = longitud11;
        claseConferencias.propTemas = nombreConferencia11;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia12"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia12.text;
        
        claseConferencias.propAbrevia = Abrevia12;
        claseConferencias.propCiudadEstado = ciudadEstado12;
        claseConferencias.propConferencista = conferencista12;
        claseConferencias.propDireccion = direccion12;
        claseConferencias.propFecha = fecha12;
        claseConferencias.propHora = hora12;
        claseConferencias.propLatitud = latitud12;
        claseConferencias.propLongitud = longitud12;
        claseConferencias.propTemas = nombreConferencia12;
        
    }
  
    if ([[segue identifier]isEqualToString:@"conferencia14"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia14.text;
        
        claseConferencias.propAbrevia = Abrevia14;
        claseConferencias.propCiudadEstado = ciudadEstado14;
        claseConferencias.propConferencista = conferencista14;
        claseConferencias.propDireccion = direccion14;
        claseConferencias.propFecha = fecha14;
        claseConferencias.propHora = hora14;
        claseConferencias.propLatitud = latitud14;
        claseConferencias.propLongitud = longitud14;
        claseConferencias.propTemas = nombreConferencia14;
        
    }
   
    
    if ([[segue identifier]isEqualToString:@"conferencia16"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia16.text;
        
        claseConferencias.propAbrevia = Abrevia16;
        claseConferencias.propCiudadEstado = ciudadEstado16;
        claseConferencias.propConferencista = conferencista16;
        claseConferencias.propDireccion = direccion16;
        claseConferencias.propFecha = fecha16;
        claseConferencias.propHora = hora16;
        claseConferencias.propLatitud = latitud16;
        claseConferencias.propLongitud = longitud16;
        claseConferencias.propTemas = nombreConferencia16;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia17"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia17.text;
        
        claseConferencias.propAbrevia = Abrevia17;
        claseConferencias.propCiudadEstado = ciudadEstado17;
        claseConferencias.propConferencista = conferencista17;
        claseConferencias.propDireccion = direccion17;
        claseConferencias.propFecha = fecha17;
        claseConferencias.propHora = hora17;
        claseConferencias.propLatitud = latitud17;
        claseConferencias.propLongitud = longitud17;
        claseConferencias.propTemas = nombreConferencia17;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia18"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia18.text;
        
        claseConferencias.propAbrevia = Abrevia18;
        claseConferencias.propCiudadEstado = ciudadEstado18;
        claseConferencias.propConferencista = conferencista18;
        claseConferencias.propDireccion = direccion18;
        claseConferencias.propFecha = fecha18;
        claseConferencias.propHora = hora18;
        claseConferencias.propLatitud = latitud18;
        claseConferencias.propLongitud = longitud18;
        claseConferencias.propTemas = nombreConferencia18;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia19"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia19.text;
        
        claseConferencias.propAbrevia = Abrevia19;
        claseConferencias.propCiudadEstado = ciudadEstado19;
        claseConferencias.propConferencista = conferencista19;
        claseConferencias.propDireccion = direccion19;
        claseConferencias.propFecha = fecha19;
        claseConferencias.propHora = hora19;
        claseConferencias.propLatitud = latitud19;
        claseConferencias.propLongitud = longitud19;
        claseConferencias.propTemas = nombreConferencia19;
        
    }
    
    
    if ([[segue identifier]isEqualToString:@"conferencia21"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia21.text;
        
        claseConferencias.propAbrevia = Abrevia21;
        claseConferencias.propCiudadEstado = ciudadEstado21;
        claseConferencias.propConferencista = conferencista21;
        claseConferencias.propDireccion = direccion21;
        claseConferencias.propFecha = fecha21;
        claseConferencias.propHora = hora21;
        claseConferencias.propLatitud = latitud21;
        claseConferencias.propLongitud = longitud21;
        claseConferencias.propTemas = nombreConferencia21;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia22"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia22.text;
        
        claseConferencias.propAbrevia = Abrevia22;
        claseConferencias.propCiudadEstado = ciudadEstado22;
        claseConferencias.propConferencista = conferencista22;
        claseConferencias.propDireccion = direccion22;
        claseConferencias.propFecha = fecha22;
        claseConferencias.propHora = hora22;
        claseConferencias.propLatitud = latitud22;
        claseConferencias.propLongitud = longitud22;
        claseConferencias.propTemas = nombreConferencia22;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia23"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia23.text;
        
        claseConferencias.propAbrevia = Abrevia23;
        claseConferencias.propCiudadEstado = ciudadEstado23;
        claseConferencias.propConferencista = conferencista23;
        claseConferencias.propDireccion = direccion23;
        claseConferencias.propFecha = fecha23;
        claseConferencias.propHora = hora23;
        claseConferencias.propLatitud = latitud23;
        claseConferencias.propLongitud = longitud23;
        claseConferencias.propTemas = nombreConferencia23;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia24"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia24.text;
        
        claseConferencias.propAbrevia = Abrevia24;
        claseConferencias.propCiudadEstado = ciudadEstado24;
        claseConferencias.propConferencista = conferencista24;
        claseConferencias.propDireccion = direccion24;
        claseConferencias.propFecha = fecha24;
        claseConferencias.propHora = hora24;
        claseConferencias.propLatitud = latitud24;
        claseConferencias.propLongitud = longitud24;
        claseConferencias.propTemas = nombreConferencia24;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia25"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia25.text;
        
        claseConferencias.propAbrevia = Abrevia25;
        claseConferencias.propCiudadEstado = ciudadEstado25;
        claseConferencias.propConferencista = conferencista25;
        claseConferencias.propDireccion = direccion25;
        claseConferencias.propFecha = fecha25;
        claseConferencias.propHora = hora25;
        claseConferencias.propLatitud = latitud25;
        claseConferencias.propLongitud = longitud25;
        claseConferencias.propTemas = nombreConferencia25;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia26"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia26.text;
        
        claseConferencias.propAbrevia = Abrevia26;
        claseConferencias.propCiudadEstado = ciudadEstado26;
        claseConferencias.propConferencista = conferencista26;
        claseConferencias.propDireccion = direccion26;
        claseConferencias.propFecha = fecha26;
        claseConferencias.propHora = hora26;
        claseConferencias.propLatitud = latitud26;
        claseConferencias.propLongitud = longitud26;
        claseConferencias.propTemas = nombreConferencia26;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia27"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia27.text;
        
        claseConferencias.propAbrevia = Abrevia27;
        claseConferencias.propCiudadEstado = ciudadEstado27;
        claseConferencias.propConferencista = conferencista27;
        claseConferencias.propDireccion = direccion27;
        claseConferencias.propFecha = fecha27;
        claseConferencias.propHora = hora27;
        claseConferencias.propLatitud = latitud27;
        claseConferencias.propLongitud = longitud27;
        claseConferencias.propTemas = nombreConferencia27;
        
    }
    if ([[segue identifier]isEqualToString:@"conferencia28"]) {
        
        claseConferencias.conferenciaNombre = labelConferencia28.text;
        
        claseConferencias.propAbrevia = Abrevia28;
        claseConferencias.propCiudadEstado = ciudadEstado28;
        claseConferencias.propConferencista = conferencista28;
        claseConferencias.propDireccion = direccion28;
        claseConferencias.propFecha = fecha28;
        claseConferencias.propHora = hora28;
        claseConferencias.propLatitud = latitud28;
        claseConferencias.propLongitud = longitud28;
        claseConferencias.propTemas = nombreConferencia28;
        
    }
    

}

/*
-(IBAction)SubString:(id)sender{
    
    NSLog([@"1234567890" substringFromIndex:4]);
    
    NSLog([@"1234567890" substringToIndex:6]);
    
    NSLog([@"1234567890" substringWithRange:NSMakeRange(3, 5)]);
    
}
*/

@end
