/* ******* */
/* Palette */
/* ******* */
@water:             #cfe3e8; //#7999C0; //54759D;
@land:              #fefefd;
@water:             #90cccb; //#79c1c0
@wooded:            #E3E8CF;
// @wooded:            #D0D8C5;
@grass:             #E3E8CF;
@agriculture:       #E6E8D3;
@residential:       #E2DBDE;
@admin:             #a8817a;

@rail_line:         #999;
@rail_fill:         #efefef;
@rail_case:         #444;

@city_text:         #222;
@city_halo:         @land;
@town_text:         #333;
@town_halo:         @land;
@village_text:      #444;
@village_halo:      @land;

@sans:              'PT Sans Regular';
@sans_bold:         'PT Sans Bold';


/* *********** */
/* backgrounds */
/* *********** */

Map {
  background-color: @water;
  buffer-size: 256;
}
#land {
  polygon-fill: @land;
}
#landuse[type='park']          { polygon-fill: @grass; }
#landuse[type='garden']        { polygon-fill: @grass; }
#landuse[type='forest']        { polygon-fill: @wooded;}
#landuse[type='wood']          { polygon-fill: @wooded; }

#waterway {
  polygon-fill: @water;
}

/* ************************* */
/* ADMINISTRATIVE BOUNDARIES */
/* ************************* */
#boundaries[admin_level=4],
#boundaries[admin_level=6],
#boundaries[admin_level=8][zoom>=12] {
  [admin_level=4] {
    outline/line-color: lighten(@admin, 25%);
    outline/line-width: 1;
  }
  eraser/line-color: white;
  eraser/line-width: 0.5;
  eraser/comp-op: darken;
  line-color: @admin;
  line-width: 0.5;
  line-dasharray: 1,3;
  line-cap: round;
  [admin_level=6],
  [admin_level=4] {
    line-dasharray: 5,5;
    line-cap: butt;
  }
}

/* ******** */
/* RAILWAYS */
/* ******** */
#railway[type='main'][zoom<12] {
  line-color: @rail_case;
  line-width: 1;
}
#railway[type='main'][zoom>=12] {
  outline/line-color: @rail_case;
  outline/line-width: 2.6;
  outline/line-cap: square;
  line-color: @rail_fill;
  line-width: 2;
  line-dasharray: 5,5;
  [zoom>=14] {
    outline/line-width: 3;
    line-width: 2;
    line-dasharray: 7,5;
  }
}


/* ****** */
/* LABELS */
/* ****** */
#place[type='city'] {
  text-name:'[name]';
  text-size: 14;
  text-face-name: @sans;
  text-halo-radius: 2;
  text-fill: @city_text;
  text-halo-fill: @city_halo;
}
#place[type='town'][zoom<12] {
  shield-file: url('icons/town.png');
  shield-name:'[name]';
  shield-size: 11;
  shield-face-name: @sans;
  shield-halo-radius: 2;
  shield-wrap-width: 50;
  shield-fill: @town_text;
  shield-halo-fill: @town_halo;
  shield-placement-type: simple;
  shield-placements: 'NE,SW,NW,SE,E,W';
  shield-text-dy: 3;
  shield-text-dx: 3;
  shield-unlock-image: true;
  shield-min-distance: 10;
  shield-avoid-edges: true;
}
#place[type='town'][zoom>=12],
#place[type='village'][zoom>=12] {
  text-name:'[name]';
  text-face-name: @sans;
  text-placement:point;
  text-fill: @village_text;
  text-size: 10;
  text-halo-fill: @village_halo;
  text-halo-radius: 2;
  text-wrap-width: 30;
  text-avoid-edges: true;
  text-label-position-tolerance: 10;
  [type='town'] {
    text-size: 11;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
  }
  [zoom>=13] {
    text-size: 11;
    [type='town'] {
      text-size: 12;
    }
  }
}
