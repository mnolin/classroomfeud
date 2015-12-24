import luxe.Color;
import luxe.Entity;
import luxe.Input;
import luxe.Sprite;
import luxe.States;
import luxe.Text;
import luxe.Vector;

import phoenix.Texture;

class TitleMenu extends luxe.State {

  //declarations
  //declarations::sprite
  var bg : Sprite;
  var logo : Sprite;
  //declarations::text
  var welcomeStr : Text;

  //defines
  var welcomeStrHeight = Luxe.screen.height - (Luxe.screen.height / 8);
  var welcomeStrSize = 20;
  var entitiesOnScreen = new Array<Entity>();

  //main functions
  public function new() {

        super( { name:'titlemenu' } );

  } //new

  override function init() {
  } //init

  override function onenter<T>(_:T) {

    //bg
    bg = new Sprite({
        name: 'background',
        color: new Color().rgb( 0xffffff ),
        size: Luxe.screen.size,
        centered: false
    });
    entitiesOnScreen.push( bg );

    //logo
    var logoTexture = Luxe.resources.texture( 'assets/title/logo.png' );

    //keep pixels crisp when scaling them, for pixel art
    logoTexture.filter_min = logoTexture.filter_mag = FilterType.nearest;

    logo = new Sprite({
        name: 'logo',
        texture: logoTexture,
        pos : new Vector( Luxe.screen.mid.x, Luxe.screen.mid.y ),
        size: new Vector( logoTexture.width, logoTexture.height )
    });
    entitiesOnScreen.push( logo );

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
    for ( entity in entitiesOnScreen )
    {
      entity.destroy();
    }
  } //onleave

  override function onkeydown( e:KeyEvent ) {
    Main.state.set('TeamSetupMenu');
  } //onkeyup

  override function onmousedown( event:MouseEvent ) {
    Main.state.set('TeamSetupMenu');
  } //onmousemove

}
