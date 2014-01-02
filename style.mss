/**********************************************************

Open Streets, DC
================

*An example of street-level map design.*

Data used by this map is © OpenStreetMap contributors and
distributed under the terms of the Open Database License.
See <http://www.openstreetmap.org/copyright> for details.

Pattern images derived from designs by Subtle Patterns and 
licensed CC-BY-SA. See <http://subtlepatterns.com> for details.

The shapefiles used in this project are based on those
provided by Mike Migurski at <http://metro.teczno.com>.
You can swap out the DC data for any other city there by
downloading the Imposm shapefile package.

***********************************************************/

/* ---- PALETTE ---- */

@water:#5ebee8;
@park:#cadea9;
@land:#e8e3db;
@school:#d2d2d2;
@buildings:#c3c3c3;

Map {
  background-color:@land;
}

#water,
#ocean {
  polygon-fill:@water;
  polygon-gamma:0.9; // reduces gaps between shapes
  polygon-pattern-file:url(images/water.png);
  polygon-pattern-comp-op:color-burn;
  polygon-pattern-alignment:global; // keeps it seamless
}

#landusages[zoom>6] {
  [type='forest'],
  [type='wood'] {
    polygon-fill:@park;
    polygon-pattern-file:url(images/wood.png);
    polygon-pattern-comp-op:multiply;
  }
  [type='cemetery'],
  [type='common'],
  [type='golf_course'],
  [type='park'],
  [type='pitch'],
  [type='recreation_ground'],
  [type='village_green'] {
    polygon-fill:@park;
  }
}

#landusages[zoom>=12] {
  [type='school'],
  [type='college'],
  [type='university'] {
    polygon-fill: @school;
  }
 }

#buildings[zoom>=13] {
    polygon-fill: @buildings;
  [zoom>=18]{
  	polygon-fill: #999898;

    }
 }
