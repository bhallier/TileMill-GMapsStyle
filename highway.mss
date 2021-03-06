@motorway:  #ffffff;
@trunk:     @motorway;
@primary:   #ffffff;
@secondary: @primary;
@road:      #ccc;
@track:     @road;
@footway:   #ffffff;
@cycleway:  #9ca;

#roads::line {
  [zoom>=8][zoom<=12] {
    [type='motorway'] { line-color:@motorway; }
    [type='trunk'] { line-color:@trunk; }
    [type='motorway'],
    [type='trunk'] {
      line-cap:round;
      line-join:round;
      [zoom=11] { line-width:2; }
    }
  }
  [zoom=11] {
    [type='primary'] { line-color:@primary; }
    [type='secondary'] { line-color:@secondary; }
    [type='primary'],
    [type='secondary'] {
      line-cap:round;
      line-join:round;
      [zoom=11] { line-width:1.5; }
    }
  }
  [zoom>=12][zoom<=13] {
    [type='motorway_link'],
    [type='trunk_link'],
    [type='primary_link'],
    [type='secondary_link'],
    [type='tertiary'],
    [type='tertiary_link'],
    [type='unclassified'],
    [type='residential'],
    [type='living_street'] {
      line-color:@road;
      [zoom=12] { line-width:0.5; }
    }
  }
  [zoom>=14][zoom<=15] {
    [type='service'],
    [type='pedestrian'] {
      line-color:@road;
      [zoom=14] { line-width:0.5; }
    }
  }
  [zoom>=15] {
    [type='track'],
    [type='footway'],
    [type='bridleway'] {
      line-color:@footway;
      line-dasharray:2,2;
      line-cap:butt;
      line-width:.3;
      [zoom=16] { line-width:.6; }
      [zoom=17] { line-width:1.6; }
      [zoom>17] { line-width:2; }
    }
    [type='steps'] {
      line-color:@footway;
      line-dasharray:2,2;
      line-cap:butt;
      [zoom=16] { line-width:2; }
      [zoom=17] { line-width:3; }
      [zoom>17] { line-width:4; }
    }
    [type='cycleway'] {
      line-color: @cycleway;
      line-dasharray:4,1;
      line-cap:butt;
      [zoom=16] { line-width:1.2; }
      [zoom=17] { line-width:1.6; }
      [zoom>17] { line-width:2; }
    }
  }
}

#motorways::case[zoom>=6][zoom<=12],
#mainroads::case[zoom>=10][zoom<=12],
#roads::case[zoom>=13][tunnel!=1][bridge!=1],
#tunnels::case[zoom>=13][tunnel=1],
#bridges::case[zoom>=13][bridge=1] {
  // -- line style --
  line-cap:round;
  line-join:round;
  line-width:0;
  [tunnel=1] {
    line-cap:butt;
    line-dasharray:6,3;
  }
  [bridge=1] { line-color:@road; }
  // -- colors --
  line-color:@road;
  [type='motorway'],
  [type='motorway_link'] {
    line-color:@road;
    [bridge=1] { line-color:@road; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color:@road;
    [bridge=1] { line-color:@road; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color:@road;
    [bridge=1] { line-color:@road; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color:@road;
    [bridge=1] { line-color:@road; }
  }
  // -- widths --
  [type='motorway'],
  [type='trunk'] {
    line-color:@road;
    [zoom=10] { line-width: 0.4 + 2; }
    [zoom=11] { line-width: 0.8 + 2; }
    [zoom=12] { line-width: 1.2 + 2; }
    [zoom=13] { line-width: 2 + 2; }
    [zoom=14] { line-width: 4 + 2; }
    [zoom=15] { line-width: 6 + 2; }
    [zoom=16] { line-width: 9 + 3; }
    [zoom=17] { line-width: 13 + 3; }
    [zoom>17] { line-width: 15 + 3; }
  }
  [type='primary'],
  [type='secondary'] {
    [zoom=10] { line-width: 0.2 + 2; }
    [zoom=11] { line-width: 0.6 + 2; }
    [zoom=12] { line-width: 1 + 2; }
    [zoom=13] { line-width: 1.2 + 2; }
    [zoom=14] { line-width: 2 + 2; }
    [zoom=15] { line-width: 4 + 2; }
    [zoom=16] { line-width: 7 + 3; }
    [zoom=17] { line-width: 9 + 3; }
    [zoom>17] { line-width: 11 + 3; }
  }
  [type='motorway_link'],
  [type='trunk_link'],
  [type='primary_link'],
  [type='secondary_link'],
  [type='tertiary'],
  [type='tertiary_link'],
  [type='unclassified'],
  [type='residential'],
  [type='living_street'] {
    [zoom=14] { line-width: 1.6 + 1.6; }
    [zoom=15] { line-width: 4 + 2; }
    [zoom=16] { line-width: 6 + 2; }
    [zoom=17] { line-width: 8 + 3; }
    [zoom>17] { line-width: 10 + 3; }
  }
  [type='service'],
  [type='pedestrian'] {
    [zoom=16] { line-width: 1.6 + 2; }
    [zoom=17] { line-width: 2 + 2; }
    [zoom>17] { line-width: 3 + 2.5; }
  }
}

#bridges::case[zoom>=13][bridge=1] {
  line-cap:butt;
}

#motorways::fill[zoom>=6][zoom<=12],
#mainroads::fill[zoom>=10][zoom<=12],
#roads::fill[zoom>=13][tunnel!=1][bridge!=1],
#tunnels::fill[zoom>=13][tunnel=1],
#bridges::fill[zoom>=13][bridge=1] {
  // -- line style --
  line-cap:round;
  line-join:round;
  line-width:0;
  // -- colors --
  line-color:lighten(#ffffff,20);
  [type='motorway'],
  [type='motorway_link'] {
    line-color:lighten(#ffffff,10);
    [tunnel=1] { line-color:@motorway * 0.5 + #ffffff; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color:lighten(@motorway,10);
    [tunnel=1] { line-color:@motorway * 0.5 + #ffffff; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color:lighten(@motorway,20);
    [tunnel=1] { line-color:@motorway * 0.5 + #ffffff; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color:lighten(@motorway,20);
    [tunnel=1] { line-color:@motorway * 0.5 + #ffffff; }
  }
  // -- widths --
  [type='motorway'],
  [type='trunk'] {
    [zoom=10] { line-width: 0.8; }
    [zoom=11] { line-width: 1; }
    [zoom=12] { line-width: 1.2; }
    [zoom=13] { line-width: 2; }
    [zoom=14] { line-width: 4; }
    [zoom=15] { line-width: 6; }
    [zoom=16] { line-width: 9; }
    [zoom=17] { line-width: 13; }
    [zoom>17] { line-width: 15; }
  }
  [type='primary'],
  [type='secondary'] {
    [zoom=10] { line-width: .6; }
    [zoom=11] { line-width: 0.8; }
    [zoom=12] { line-width: 1; }
    [zoom=13] { line-width: 1.2; }
    [zoom=14] { line-width: 2; }
    [zoom=15] { line-width: 4; }
    [zoom=16] { line-width: 7; }
    [zoom=17] { line-width: 9; }
    [zoom>17] { line-width: 11; }
  }
  [type='motorway_link'],
  [type='trunk_link'],
  [type='primary_link'],
  [type='secondary_link'],
  [type='tertiary'],
  [type='tertiary_link'],
  [type='unclassified'],
  [type='residential'],
  [type='living_street'] {
    [zoom=14] { line-width: 1.6; }
    [zoom=15] { line-width: 4; }
    [zoom=16] { line-width: 6; }
    [zoom=17] { line-width: 8; }
    [zoom>17] { line-width: 10; }
  }
  [type='service'],
  [type='pedestrian'] {
    [zoom=16] { line-width: 1.6; }
    [zoom=17] { line-width: 2; }
    [zoom>17] { line-width: 3; }
  }
}

/* ---- ONE WAY ARROWS ---- */

#road-label::oneway_arrow[zoom>15][oneway=1] {
  marker-file:url("shape://arrow");
  marker-width:15;
  marker-placement:line;
  marker-line-width:1;
  marker-line-opacity:0.5;
  marker-line-color:#c3c3c3;
  marker-spacing: 200;
  marker-fill:spin(darken(@motorway,50),-10);
  marker-opacity:0.8;
}