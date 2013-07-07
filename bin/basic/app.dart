import "package:jaded/jaded.dart";
import "package:express/express.dart";
import "dart:io";

import "views/jade.views.dart" as views;
import "public/jade.views.dart" as pages;

basicApp(){
  int counter = 0;
  var app = new Express()
    ..config('views','basic/views')
    ..use(new JadeViewEngine(views.JADE_TEMPLATES, pages:pages.JADE_TEMPLATES))
    ..use(new StaticFileHandler("basic/public"))
    
    ..get('/', (ctx){
      ctx.render('index', {'title': 'Home'});
    })
    
    ..get('/error', (ctx){
      throw new ArgumentError("custom error in handler");
    })
  
    ..get('/counter', (ctx){
      ctx.sendJson({'counter': counter++});
    });

 app.listen("127.0.0.1", 8000);
}