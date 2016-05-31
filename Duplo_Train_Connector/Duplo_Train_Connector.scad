$fa=1;
$fs=0.5;

// This is a modification to the work by user tomkalei. https://www.youmagine.com/designs/duplo-train-connector.
// I just added a chamfer and tweaked values.

// Connect two male ends of Duplo trains

height=5; // height of the part
d1 = 17; // original outer diameter from Duplo 18 def
d2 = d1-3;    // shrinked for better movement
inner_diameter = 8; // inner hole
keyslot_width = 6.4; // Inner diameter 6.3def

// part1();
// part2();
// connector_blocking();
connector_normal();

module default_part() {
    difference () {
	cylinder (d=d1, height, center=true);
	cylinder (d=inner_diameter, h=height+2, center=true);
    translate([0,0,1])
    cylinder (h= 6, d1=inner_diameter -3, d2=inner_diameter +3, center=true);
    translate([0,0,-1])
    cylinder (h= 6, d1=inner_diameter +3, d2=inner_diameter -3, center=true);
	translate ([5,0,0])
	cube ([10,keyslot_width,6], center=true);
    }    
}

module part1 () {
    y = (d1-inner_dia)/2;
    x = 8.5;
    // This part is constructed so that it won't move on the train.
    difference () {
	union () {
	    cylinder (d=d1, height, center=true);
	    translate ([x/2,y,0])
	    cube ([x,y,height], center=true);
	    translate ([x/2,-y,0])
	    cube ([x,y,height], center=true);
	    }
	cylinder (d=inner_diameter, h=height+2, center=true);
	translate ([5,0,0])
	cube ([10,keyslot_width,6], center=true);
    }
}

module part2() {
    y = (18-inner_dia)/2;
    x = 3;
    // This part should move easily on the train
    difference () {
	cylinder (d=d2, height, center=true);
	cylinder (d=inner_diameter, h=height+2, center=true);
	translate ([5,0,0])
	cube ([10,keyslot_width,6], center=true);
    }
}

module connector_blocking () {
    translate ([7,0,0])
    part1();
    translate ([-7,0,0])
    mirror ([1,0,0])
    part2();
}

module connector_normal(){
    translate ([7,0,0])
    default_part();
    translate ([-7,0,0])
    mirror ([1,0,0])
    default_part();
    }