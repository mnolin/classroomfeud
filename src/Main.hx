import luxe.Color;
import luxe.Input;
import luxe.States;
import luxe.Text;
import luxe.Vector;

import mint.Control;
import mint.focus.Focus;
import mint.layout.margins.Margins;
import mint.types.Types;
import mint.render.luxe.Convert;
import mint.render.luxe.LuxeMintRender;


import phoenix.Texture;

class Main extends luxe.Game {

    //declarations
    public static var state: States;

    public static var disp : Text;
    public static var canvas: mint.Canvas;
    public static var rendering: LuxeMintRender;
    public static var layout: Margins;
    public static var focus: Focus;

    public static var assetPath_logo = 'assets/title/logo.png';

    var canvas_debug : Text;
    var debug : Bool = false;

    //main funtions
    override function config(config:luxe.AppConfig) {

        config.preload.textures = [
          { id:assetPath_logo, filter_min:nearest, filter_mag:nearest },
        ];

        return config;

    } //config

    function setStateClean(to:String) {

      disp.text = '';

      canvas.destroy_children();
      state.set(to);

    } //setStateClean

    override function ready() {

      Luxe.renderer.clear_color.rgb(0xffffff);

      rendering = new LuxeMintRender();
      layout = new Margins();

      canvas = new mint.Canvas({
        name:'canvas',
        rendering: rendering,
        options: { color:new Color(1,1,1,0.0) },
        x: 0, y:0, w: 960, h: 640
      });

      focus = new Focus(canvas);

      disp = new Text({
        name:'display.text',
        pos: new Vector(Luxe.screen.w-10, Luxe.screen.h-10),
        align: luxe.TextAlign.right,
        align_vertical: luxe.TextAlign.bottom,
        point_size: 15,
        text: 'usage text goes here'
      });

      canvas_debug = new Text({
        name:'debug.text',
        text: 'debug:  (${Luxe.snow.os} / ${Luxe.snow.platform})',
        point_size: 14,
        pos: new Vector(950, 10),
        align: right,
        depth: 999,
        color: new Color()
      });

      state = new States({ name:'state' });

      state.add( new TitleMenu() );
      state.add( new TeamSetupMenu() );

      setStateClean( 'titlemenu' );

    } //ready

    override function onrender() {

        canvas.render();

        if(debug) {
            for(c in canvas.children) {
                drawc(c);
            }
        }

    } //onrender

    override function update(delta:Float) {

      canvas.update( delta );

    } //update

    override function onmousemove(e) {

      canvas.mousemove( Convert.mouse_event(e) );

      debugtext();

    } //onmousemove

    public function debugtext() {

        var s = 'debug:  (${Luxe.snow.os} / ${Luxe.snow.platform})\n';

        s += 'canvas nodes: ' + (canvas != null ? '${canvas.nodes}' : 'none');
        s += '\n';
        s += 'captured: ' + (canvas.captured != null ? '${canvas.captured.name} [${canvas.captured.nodes}]' : 'none');
        s += (canvas.captured != null ? ' / depth: '+canvas.captured.depth : '');
        s += '\n';
        s += 'marked: ' + (canvas.marked != null ?  canvas.marked.name : 'none');
        s += '\n';
        s += 'focused: ' + (canvas.focused != null ? canvas.focused.name : 'none');
        s += '\n\n';

        canvas_debug.text = s;

    } //debugtext

    override function onmousewheel(e) {
        canvas.mousewheel( Convert.mouse_event(e) );
    } //onmousewheel

    override function onmouseup(e) {
        canvas.mouseup( Convert.mouse_event(e) );
    }  //onmouseup

    override function onmousedown(e) {
        canvas.mousedown( Convert.mouse_event(e) );
    } //onmousedown

    override function onkeydown(e:luxe.Input.KeyEvent) {
        canvas.keydown( Convert.key_event(e) );
    } //onkeydown

    override function ontextinput(e:luxe.Input.TextEvent) {
        canvas.textinput( Convert.text_event(e) );
    } //ontextinput

    override function onkeyup(e:luxe.Input.KeyEvent) {

        if(e.keycode == Key.key_d && e.mod.ctrl) { debug = !debug; trace('debug: $debug'); }
        if(e.keycode == Key.key_v && e.mod.ctrl) canvas.visible = !canvas.visible;

        canvas.keyup( Convert.key_event(e) );

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        debugtext();

    } //onkeyup

    function drawc(control:Control) {

        if(!control.visible) return;

        Luxe.draw.rectangle({
            depth: 1000,
            x: control.x,
            y: control.y,
            w: control.w,
            h: control.h,
            color: new Color(1,0,0,0.5),
            immediate: true
        });

        for(c in control.children) {
            drawc(c);
        }

    } //drawc

} //Main
