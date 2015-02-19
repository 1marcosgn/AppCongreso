//
//  ParticipantesViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParticipantesViewController.h"

@interface ParticipantesViewController ()

@end

@implementation ParticipantesViewController

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
	
    [scrollListaParticipantes setScrollEnabled:YES];
    [scrollListaParticipantes setContentSize:CGSizeMake(50, 2300)];

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

-(void)AbrirWeb:(NSString *)pagina{
    
    NSURL *url = [ [ NSURL alloc ] initWithString: pagina ];
    
    [[UIApplication sharedApplication] openURL:url];
    
}


-(IBAction)Cemex:(id)sender{
    
    [self AbrirWeb:@"http://www.cemexmexico.com/index.aspx"];

    
}
-(IBAction)Honda:(id)sender{
    
    [self AbrirWeb:@"http://www.hondamilenio.com"];

    
}
-(IBAction)Ibero:(id)sender{
    
    [self AbrirWeb:@"http://sitio.lag.uia.mx"];

    
}
-(IBAction)Lala:(id)sender{
    
    [self AbrirWeb:@"http://www.lala.com.mx"];

    
}
-(IBAction)Oma:(id)sender{
    
    [self AbrirWeb:@"http://www.oma.aero"];

    
}
-(IBAction)Pasa:(id)sender{
    
    [self AbrirWeb:@"http://www.gen.tv"];

    
}
-(IBAction)Penoles:(id)sender{
    
    [self AbrirWeb:@"http://www.penoles.com.mx"];

    
}
-(IBAction)Tyson:(id)sender{
    
    [self AbrirWeb:@"http://www.tyson.com.mx"];

    
}
-(IBAction)Utt:(id)sender{
    
    [self AbrirWeb:@"http://www.utt.edu.mx"];

    
}
-(IBAction)Santos:(id)sender{
    
    [self AbrirWeb:@"http://www.clubsantoslaguna.com.mx"];

    
}
-(IBAction)REDESR:(id)sender{
    
    [self AbrirWeb:@"http://www.redesrlaguna.org"];
    
}

@end
