import luxe.States;
import luxe.Input;

import phoenix.Texture;

class Main extends luxe.Game {

    //declarations
    public static var state: States;

    //main funtions
    override function config(config:luxe.AppConfig) {

        config.preload.textures = [
          { id:'assets/title/logo.png' },
        ];

        return config;

    } //config

    override function ready() {

      state = new States({ name:'state' });

      state.add( new TitleMenu() );
      state.add( new TeamSetupMenu() );

      state.set('titlemenu');

    } //ready

    override function update(delta:Float) {

    } //update

} //Main
