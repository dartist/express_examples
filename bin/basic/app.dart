import "package:jaded/jaded.dart";
import "package:express/express.dart";
import "dart:io";

basicApp(){
  int counter = 0;
  var app = new Express()
    ..config('views','basic/views')
    ..use(new JadeViewEngine())
    ..use(new StaticFileHandler("basic/public"))
    
    ..get('/', (ctx){
      ctx.render('index', {'title': 'Home'});
    })
  
    ..get('/counter', (ctx){
      ctx.sendJson({'counter': counter++});
    });

 app.listen("127.0.0.1", 8000);
}