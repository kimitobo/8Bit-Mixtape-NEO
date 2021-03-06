    // MixTape 3d Printed Case///////////////////////////

plugHeight = 9.8; // [6:10]
tapeHeight = 10.0; //
topThickness = 1.6; 

usb_charger = false;
cutout_aux_ports = true;

rotate([180,0,$t*380]) translate([-50,-30,0]){

//PCB();
//parts();

difference(){
    
    FullCase();
    
    // Plugs 
    translate([2.5,50,tapeHeight-plugHeight+topThickness]) cube([13,20,plugHeight+1],false); 
    translate([83.5,50,tapeHeight-plugHeight+topThickness]) cube([13,20,plugHeight+1],false);
    
    // write protectors 
    translate([10,0,0.5*tapeHeight+1.6]) cube([4,1,4],true);
    translate([14,0,0.5*tapeHeight+1.6]) cube([4,3,4],true);
    translate([89,0,0.5*tapeHeight+1.6]) cube([4,1,4],true);
    translate([85,0,0.5*tapeHeight+1.6]) cube([4,3,4],true);

    // Power signs
    if (!usb_charger) {
        translate([41,0,0.5*tapeHeight+1.6]) cube([4,1.5,1],true);
        translate([41,0,0.5*tapeHeight+1.6]) cube([1,1.5,4],true);
    
        translate([58,0,0.5*tapeHeight+1.6]) cube([4,1.5,1],true); 
    }
}
}

module FullCase(){
    tapeBody();
    tapeTop();
}


// Modules ///////////////////////////////

module PCB(){
 color("DarkKhaki") 
    translate ([0,0,tapeHeight+1.6]) linear_extrude(height = 1.6, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_bottom.dxf", convexity=3);
 color("Gold") 
     translate ([0,0,tapeHeight+3.2]) linear_extrude(height = 0.2, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_PCB.dxf", convexity=3);
    
 color("DarkKhaki") 
    translate ([0,0,tapeHeight+2*topThickness]) linear_extrude(height = 1.6, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_PCB_TrapezBoard.dxf", convexity=3);
 color("Gold") 
     translate ([0,0,tapeHeight+3*topThickness]) linear_extrude(height = 0.2, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_PCB_TrapezCircuit.dxf", convexity=3);
}

module tapeBody(){ 
  difference(){ 
    //color("Deeppink") 
    translate ([0,0,1.6]) linear_extrude(height = tapeHeight, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_bottom.dxf", convexity=3);  
    
    translate([11,50,0.7*tapeHeight+topThickness+3]) cube([8,12,0.7*tapeHeight],true);
      
     if (!usb_charger) {
        translate ([0,0,0.6]) linear_extrude(height = 12, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_MainCase.dxf", convexity=3);
     } else {
         translate ([0,0,0.6]) linear_extrude(height = 12, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_MainCase_USB.dxf", convexity=3);
     }
    
    //Face hole
    translate([25,64,0.5*tapeHeight+topThickness]) cube([12,4,0.7*tapeHeight],true);
    if (!usb_charger) { translate([49.5,64,0.5*tapeHeight+topThickness]) cube([16,4,0.7*tapeHeight],true); }
    translate([74.3,64,0.5*tapeHeight+topThickness]) cube([12,4,0.7*tapeHeight],true);
      
    translate([36,65,0.5*tapeHeight+topThickness]) cube([4,4,0.6*tapeHeight],true);
    translate([63,65,0.5*tapeHeight+topThickness]) cube([4,4,0.6*tapeHeight],true);
    
    if (usb_charger) {
        // cutout usb port
        translate([49.5,64,0.5*tapeHeight+topThickness+3]) cube([20,14,0.7*tapeHeight+4],true);
    }
    if (cutout_aux_ports) {
        translate([1.5,23,0.7*tapeHeight+topThickness+3]) cube([20,12,0.7*tapeHeight],true);
        translate([90,23,0.7*tapeHeight+topThickness+3]) cube([20,12,0.7*tapeHeight],true);      
    }
    
  }
  
  
  //color("DarkKhaki") 
  if (!usb_charger) {
    translate([40,0.05,1.6]) cube([20,10,tapeHeight-6],false);
  }
}

module tapeTop(){ 
 
difference(){ 
 color("Deeppink") 
     translate ([0,0,-1.5]) linear_extrude(height = 1.5, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_TopTrapez.dxf", convexity=3);
     
   color("Gold") 
     translate ([0,0,-2.2]) linear_extrude(height = 3, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_Holes.dxf", convexity=3);
   translate([50,53,-2.2]) cylinder(h=1.2, r=1.3, center=false, ,$fn=30);
}   
    

difference(){    
  color("Deeppink") 
     translate ([0,0,0]) linear_extrude(height = 1.6, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_bottom.dxf", convexity=3);

  translate([4,3,-1]) cylinder(h=1.5, r=1.3, center=false, ,$fn=30);
  translate([95,3,-1]) cylinder(h=1.5, r=1.3, center=false, ,$fn=30);
  translate([4,61,-1]) cylinder(h=1.5, r=1.3, center=false, ,$fn=30);
  translate([95,61,-1]) cylinder(h=1.5, r=1.3, center=false, ,$fn=30);
    
  color("Pink") 
     translate ([0,0,-1.3]) linear_extrude(height = 2, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_WindowRect.dxf", convexity=3); 
    
  difference(){    
  color("Gold") 
     translate ([0,0,-0.5]) linear_extrude(height = 1, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_BigRect.dxf", convexity=3);  
  

  translate ([0,0,-3]) linear_extrude(height = 10, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_MidRect.dxf", convexity=3);   
  }
  
  translate ([0,0,-3]) linear_extrude(height = 5.5, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_Wheels.dxf", convexity=3); 
}

  translate ([0,0,0.4]) linear_extrude(height = 1.2, center = false, convexity = 10, twist = 0) import("mixtape_case_3D_NutWheels.dxf", convexity=3); 

}
 

module parts(){
    // IC-Socket
  color("Grey")
      translate([44,22.5,tapeHeight+2*topThickness]) cube([11,13,4],false);
    
  difference(){
  color("Black")
      translate([45,23.5,tapeHeight+2*topThickness]) cube([9,11,7],false);
        
    translate([49.5,34.5,tapeHeight+2*topThickness+6]) cylinder(h=10, r=1.5, center=false, ,$fn=30);
    }
    
    // NEO-Pixels
    for (a = [ 0 : 6.3 : 46 ])
    translate([a,0,0]) NEOpixel();
    
    module NEOpixel(){
    color("White")
      translate([25.2,52.5,tapeHeight+3*topThickness]) cube([5,5,2],false);
        
    color("Deeppink")
      translate([27.7,55,tapeHeight+3*topThickness]) cylinder(h=2.5, r=2, center=false, ,$fn=30);
    }
    
    // Pots
    potentiometer();
    translate ([42,0,0]) potentiometer();
    
    module potentiometer(){
    color("Grey")
      translate([29,29,tapeHeight+2*topThickness]) cylinder(h=10, r=3.5, center=false, ,$fn=30);
    
    color("Deeppink")
        translate([29,29,tapeHeight+2*topThickness+2]) cylinder(h=12, r1=6, r2=4.5, center=false, ,$fn=30);
    }
    
    // Buttons
    button();
    translate ([58,0,0]) button();
    
    module button(){
    color("Grey")
      translate([17.5,9.8,tapeHeight+2*topThickness]) cube([6,6,3],false);
        
    color("Red")
      translate([20.5,12.8,tapeHeight+2*topThickness]) cylinder(h=5, r=1.5, center=false, ,$fn=30);
    }

}
