import 'dart:io';

void main() {
  // for loop :
  for (int i=0; i<5; i++){
    stdout.writeln("SOLOEDITS");
    for (int j=1; j<=3; j++){
      stdout.write(":3");
      for (int k=1; k<=3; k++) {
        if(k == 3){
          stdout.writeln("</3");
        }
        else{
          stdout.write("</3");
        }
      }
    }
  }

  // while loop : we have to reset the variable we assign to loop to get the expected outcome
  int a = 0 ;
  int b = 0 ;
  int c = 0 ;

  while (a < 5){
    stdout.writeln("SOLOEDITS");
    b = 0 ;
    while (b<3){
      stdout.write(":3");
      c = 0;
      while (c<3){
        if(c == 2){
          stdout.writeln("</3");
        }else{
          stdout.write("</3");
        }
        c++;
      }
      b++;
    }
    a++;
  }

  /*
  output of both loops :
  SOLOEDITS
      :3</3</3</3
      :3</3</3</3
      :3</3</3</3
  SOLOEDITS
      :3</3</3</3
      :3</3</3</3
      :3</3</3</3
  SOLOEDITS
      :3</3</3</3
      :3</3</3</3
      :3</3</3</3
  SOLOEDITS
      :3</3</3</3
      :3</3</3</3
      :3</3</3</3
  SOLOEDITS
      :3</3</3</3
      :3</3</3</3
      :3</3</3</3
   */
}