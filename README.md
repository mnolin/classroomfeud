# classroomfeud
(In early development) A family feud inspired game for educators. Development for this started when a friend of mine was trying to create a family feud-esque game for his students to play with questions/data of his own that he sourced from students. That was very challenging in Power Point so the goal of this is to create a game that fits the classroom and where educators can easily input their own data to be used for the questions.

# development setup
- Programming language: http://haxe.org/
- Engine: http://luxeengine.com/
  - luxe engine is built on http://underscorediscovery.github.io/snow/ and http://underscorediscovery.github.io/flow/

## my setup
- Mac OS X 10.11.2
- Haxe installed via Mac OS X installer from http://haxe.org/download/
- Followed setup steps from http://luxeengine.com/docs/setup.html and ran:
  - `haxelib git flow https://github.com/underscorediscovery/flow.git`
  - `haxelib git snow https://github.com/underscorediscovery/snow.git`
  - `haxelib git luxe https://github.com/underscorediscovery/luxe.git`
- Then I had to run `haxelib setup` and because of new restrictions in OS X, I placed it in `/usr/local/lib/haxe`
- Then I installed the flow shortcut by following the instructions at http://underscorediscovery.github.io/flow/#guide:
  - and downloading this https://raw.githubusercontent.com/underscorediscovery/flow/master/setup/flow and placing it in `/usr/local/bin`
- IDE: https://atom.io/, packages: flow, haxe, language-haxe, linter
  - I currently can't build from within Atom (https://github.com/snowkit/atom-haxe/issues/42)
  - I build via the following command `flow run web`
- I'm also using this guide for a refresher on git commands https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
- I followed the instructions here: to get my git diff tool to be the default filemerge tool on mac: https://gist.github.com/bkeating/329690 (although it gives me a few errors on launch it still works to more visually look at diffs and I don't think the errors affect anything I'm doing.)
