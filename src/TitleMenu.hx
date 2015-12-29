import luxe.Color;
import luxe.Entity;
import luxe.Input;
import luxe.Sprite;
import luxe.States;
import luxe.Text;
import luxe.Vector;

import phoenix.Texture;

import mint.Control;
import mint.layout.margins.Margins;
import mint.types.Types;
import mint.render.luxe.Convert;
import mint.render.luxe.LuxeMintRender;
import mint.render.luxe.Label;

class TitleMenu extends luxe.State {

  //declarations
  //declarations::text
  var welcomeStr : Text;

  //defines
  var welcomeStrHeight = Luxe.screen.height - (Luxe.screen.height / 8);
  var welcomeStrSize = 20;

  //main functions
  public function new() {

        super( { name:'titlemenu' } );

  } //new

  override function init() {
  } //init

  override function onenter<T>(_:T) {

    //logo
    var logoTexture = Luxe.resources.texture( Main.assetPath_logo );

    var logoPanel = new mint.Panel({
      parent: Main.canvas,
      x:0, y:0, w:logoTexture.width, h:logoTexture.height,
      options: {
        color:new Color()
      },
    });

    var logo = new mint.Image({
      parent: logoPanel,
      w: logoTexture.width, h: logoTexture.height,
      path: Main.assetPath_logo
    });
    //entitiesOnScreen.push( logo );

    //welcomeStr
    welcomeStr = new luxe.Text({
      color : new Color( 0,0,0,1 ).rgb( 0x000000 ),
      pos : new Vector( Luxe.screen.mid.x, welcomeStrHeight ),
      font : Luxe.renderer.font,
      point_size : welcomeStrSize,
      align : luxe.TextAlign.center
    });
    entitiesOnScreen.push( welcomeStr );

    welcomeStr.text = 'Welcome! To start the game press any button or key.';
  } //onenter

  override function onleave<T>(_:T) {

    Main.canvas.destroy_children();

  } //onleave

  override function onkeydown( e:luxe.Input.KeyEvent ) {

    Main.state.set('TeamSetupMenu');

  } //onkeyup

  override function onmousedown( e ) {

    Main.state.set('TeamSetupMenu');

  } //onmousemove

}
