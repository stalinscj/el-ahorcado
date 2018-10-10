program ahorcado;

uses

crt;

type

cad=string[10];

var

palabra,auxi,adi:cad;

letra:char;

posi,l:integer;

procedure comienzo(var palabra,auxi,adi:cad;var l:integer);

var

i:integer;

begin

gotoxy(25,10);

writeln('JUEGO DEL AHORCADO');

writeln('Escribe la palabra a adivinar: ');

readln(palabra);

l:=length(palabra);

auxi:=palabra;

adi[0]:=chr(l); 

for i:=1 to l do

adi[i]:='_'; 

clrscr;

end;

procedure acierto(auxi:cad;var posi:integer;letra:char);

var

n:integer;

begin

delete(auxi,1,posi);

n:=posi;

posi:=pos(letra,auxi);

if posi<>0 then

posi:=posi+n;

end;

procedure dibujo(p:integer);

var

parte:string[7];

f,c:integer;

begin

parte:='O/I\I/\'; 

case p of 

1 : begin

f:=1; c:=2;

end;

2 : begin

f:=2; c:=1;

end;

3 : begin

f:=2; c:=2;

end;

4 : begin

f:=2; c:=3;

end;

5 : begin

f:=3; c:=2;

end;

6 : begin

f:=4; c:=1;

end;

7 : begin

f:=4; c:=3;

end;

end;

gotoxy(7+c,18+f);

write(parte[p]);

end;

procedure pregunta(var letra:char;var posi:integer;var adi,auxi:cad;palabra:cad);

var

z,p:integer;

begin

z:=1;

p:=1;

repeat

gotoxy(5,2);

writeln('Dime una letra');

readln(letra);

posi:=pos(letra,palabra); 

writeln('posicion: ',posi);

if posi<>0 then 

repeat

adi[posi]:=letra;

gotoxy(10,10);

write(adi); 

acierto(auxi,posi,letra);

writeln;

until (posi=0)

else 

begin

gotoxy(3,14);

writeln('LETRAS QUE NO PERTENECEN A LA PALABRA:');

gotoxy(5+z,15);

write(letra); 

z:=z+2;

dibujo(p);

p:=p+1;

end;

until (adi=palabra) or (p=8);

writeln;

end;

begin 

clrscr;

comienzo(palabra,auxi,adi,l);

writeln('LA PALABRA A ADIVINAR TIENE: ',l,' LETRAS');

pregunta(letra,posi,adi,auxi,palabra);

if palabra=adi then

begin

gotoxy(20,20);

writeln('нннн HAS GANADO !!!!!');

end

else

begin

writeln('Has perdido,la palabra era: ',palabra);

gotoxy(20,20);

writeln('нннн AHORCADO !!!!');

end;

READKEY

end.