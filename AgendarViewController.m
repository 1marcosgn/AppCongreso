//
//  AgendarViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AgendarViewController.h"

@interface AgendarViewController ()

@end

@implementation AgendarViewController
@synthesize fechaInicial;
@synthesize hora;
@synthesize conferencia;

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
	
    //[self AjusteTiempoDefault];
    
    [self AjusteTiempoDefault:fechaInicial time:hora];
    
    //[datePicker setDate:[NSDate date]];
    
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



-(IBAction)Notificarme:(id)sender{
    
    [self EstableceTiempo:[datePicker date]Mensaje:@""];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Red ESR" message:@"La notificación ha sido Agendada correctamente, usted será informado cuando la Conferencia esté por comenzar" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
    
    [alert show];
    
}

-(void)AjusteTiempoDefault:(NSString *)fecha time:(NSString *)time{
    
//    NSLog(fecha);
//    NSLog(hora);
    
    NSString *dia = [fecha substringWithRange:NSMakeRange(11, 2)];
    NSString *tiempo = [time substringToIndex:5]; 
    
    NSString *fechaNueva = [NSString stringWithFormat:@"%@ Sep 2012 %@:00 -0500", dia, tiempo];
    
    //NSLog(fechaNueva);
    
    //La cadena se obtiene de una propiedad de la ventana fuente
    //NSString *cadenaFechaHora = @"05 Sep 2012 08:45:00 -0500";
    NSString *cadenaFechaHora = fechaNueva;
    
    //objeto para dar formato a la fecha
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    //se establece la sintaxis de la fecha
    //[dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZ"];
    
    [dateFormatter setDateFormat:@"dd MMM yyyy HH:mm:ss ZZ"];
    
    //objeto NSDate para obtener la fecha convertida
    NSDate *dateFromString = [[NSDate alloc]init];
    
    
    dateFromString = [dateFormatter dateFromString:cadenaFechaHora];
    
    //NSLog(@"Date: %@",dateFromString);
    
    if (dateFromString == nil) {
        dateFromString = [NSDate date];
    }
    
    //[self EstableceTiempo:dateFromString];
    
    [datePicker setDate:dateFromString];
    
    
    /*
    //La cadena se obtiene de una propiedad de la ventana fuente - CADENA IMPORTANTE
    
    //debe mostrar una cadena como la siguiente
    //NSString *cadenaFechaHora = @"07 Aug 2012 17:13:00 -0500";
    
    
    NSString *cadenaFechaHora = fecha;
    
    
    //objeto para dar formato a la fecha
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    //se establece la sintaxis de la fecha
    //[dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZ"];
    
    [dateFormatter setDateFormat:@"dd MMM yyyy HH:mm:ss ZZ"];
    
    //objeto NSDate para obtener la fecha convertida
    NSDate *dateFromString = [[NSDate alloc]init];
    
    
    dateFromString = [dateFormatter dateFromString:cadenaFechaHora];
    
    NSLog(@"Date: %@",dateFromString);
    
    
    //[self EstableceTiempo:dateFromString];
    
    datePicker.date = dateFromString;
    */
    
}

-(void)EstableceTiempo:(NSDate *)fecha Mensaje:(NSString *)Mensaje{
    
    
    if ([Mensaje isEqual:@""]) {
        
        Mensaje = [NSString stringWithFormat:@"Está por comenzar su Conferencia: %@, att:Comité Organizador",conferencia];
        
    }
    
    
    [[MKLocalNotificationsScheduler sharedInstance] scheduleNotificationOn:fecha text:Mensaje action:@"Ver" sound:nil launchImage:nil andInfo:nil];
    
}




@end
