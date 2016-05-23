Program galo;
Uses crt;
Type player = record
               sym : char;
               stat : boolean;
              end;
Var op : integer;
    play : array [1..2] of player;
    t : array [1..9] of char;
    gameemp : boolean;

Procedure Janelatit; (*Criaao de janela do titulo*)
Var i : integer;
 Begin
   Textbackground (0);
   clrscr;
   textcolor (14); textbackground (1);
   gotoxy (20,3); Write ('ษอออออออออออออออออออออออออออออออออออออออป');
   For i:= 0 to 6 do
    begin
     gotoxy (20,4+i); Write ('บ'); gotoxy (60,4+i); Writeln ('บ');
    end;
   gotoxy (20,4+i); write ('ศอออออออออออออออออออออออออออออออออออออออผ');
   gotoxy (32,5);
   Writeln ('Jogo Do Galo v1.0');
   gotoxy (34,8);
   Writeln ('By, Mehul Ir ');
 End;
Procedure Janelamenu;  (*Cricao de  janela de menu*)
var i : integer;
 begin
  textbackground (1);
  textcolor (14);
  Gotoxy (20,20); Write ('ษอออออออออออออออออออออออออออออออออออออออป');
   For i:= 0 to 3 do
    begin
     gotoxy (20,21+i); Write ('บ'); gotoxy (60,21+i); Writeln ('บ');
    end;
  Gotoxy (20,21+i+1); Write ('ศอออออออออออออออออออออออออออออออออออออออผ');
  Gotoxy (41,22); textbackground (0); textcolor (7); Write ('   Comear a Jogar');
  Gotoxy (23,23); textbackground (0); textcolor (14); Write ('    Sair     ');
  Gotoxy (23,22); textbackground (1); Write ('    Jogar    ');
 end;
Procedure imageesq;
 begin
   textbackground (0);
   textcolor (14);
   gotoxy (4,6); Writeln ('Û   Û ');
   Gotoxy (4,7); Writeln (' Û Û  ');
   Gotoxy (4,8); Writeln ('  Û   ');
   Gotoxy (4,9); Writeln (' Û Û  ');
   Gotoxy (4,10);Writeln ('Û   Û ');
   Textcolor (1);
   Gotoxy (6,12); Writeln ('  Û฿Û   ');
   Gotoxy (6,13); Writeln (' Û   Û  ');
   Gotoxy (6,14); Writeln ('Û     Û ');
   Gotoxy (6,15); Writeln (' Û   Û  ');
   Gotoxy (6,16); Writeln ('  ÛÜÛ   ');
 end;
Procedure imagedrt;
 begin
   textbackground (0);
   textcolor (14);
   Gotoxy (68,12); Writeln ('Û   Û ');
   Gotoxy (68,13); Writeln (' Û Û  ');
   Gotoxy (68,14); Writeln ('  Û   ');
   Gotoxy (68,15); Writeln (' Û Û  ');
   Gotoxy (68,16); Writeln ('Û   Û ');
   Textcolor (1);
   Gotoxy (70,6); Writeln ('  Û฿Û   ');
   Gotoxy (70,7); Writeln (' Û   Û  ');
   Gotoxy (70,8); Writeln ('Û     Û ');
   Gotoxy (70,9); Writeln (' Û   Û  ');
   Gotoxy (70,10); Writeln ('  ÛÜÛ   ');
 end;
procedure intermenu;  (*cricao de mov. de menus*)
Var k : char;
 begin
  gotoxy (23,22); op := 1;
  Repeat
    k := Readkey;
     If k = #72 then
      Begin
        If Wherey = 23 then
         begin
           Gotoxy (41,22); textbackground (0); textcolor (7); Write ('   Comear a Jogar');
           Gotoxy (23,23); textbackground (0); textcolor (14); Write ('    Sair     ');
           Gotoxy (23,22); textbackground (1); textcolor (14); Write ('    Jogar    ');
           op := 1;
         end
      End;

    If k = #80 then
     Begin
        If Wherey = 22 then
         begin
           Gotoxy (41,22); textbackground (0); textcolor (7); Write ('   Sai do Jogo    ');
           Gotoxy (23,22); textbackground (0); textcolor (14); Write ('    Jogar    ');
           Gotoxy (23,23); textbackground (1); textcolor (14); Write ('    Sair     ');
           op := 2;
         end;
     End;
  Until k = #13;
 end;
Procedure gameplay;
Var i, jogadas : integer;
    k : char;
    jogou : boolean;
 begin
   textbackground (0);
   play[1].sym := 'x';
   play[2].sym := 'o' ;
   play[1].stat := false;
   play[2].stat := false;
   gameemp := false;
   jogadas := 0;
   t[1] := '1'; t[2] := '2'; t[3] := '3'; t[4] := '4';
   t[5] := '5'; t[6] := '6'; t[7] :='7'; t[8] := '8'; t[9] := '9';
   textcolor (14); textbackground (1);
   gotoxy (33,10);  Writeln  ('ษอออหอออหอออป');
   gotoxy (33,11); Writeln  ('บ ',T[1],' บ ',T[2],' บ ',T[3],' บ');
   gotoxy (33,12); Writeln  ('ฬอออฮอออฮอออน');
   gotoxy (33,13); Writeln  ('บ ',T[4],' บ ',T[5],' บ ',T[6],' บ');
   gotoxy (33,14); Writeln  ('ฬอออฮอออฮอออน');
   gotoxy (33,15); Writeln  ('บ ',T[7],' บ ',T[8],' บ ',T[9],' บ');
   gotoxy (33,16); Writeln  ('ศอออสอออสอออผ');
 Repeat
  for i:= 1 to 2 do
   begin
   (*teclado testes*)
   If (play[1].stat = false) and (play[2].stat = false) and (gameemp = false) then
   Begin
     If i = 1 then
      begin
        textbackground (4); gotoxy (4,22); Writeln ('Jogador 1');
        textbackground (0); gotoxy (69,22); Writeln ('Jogador 2');
      end else
      begin
        textbackground (0); gotoxy (4,22); Writeln ('Jogador 1');
        textbackground (4); gotoxy (69,22); Writeln ('Jogador 2');
      end;
      jogou := false;
    Repeat
     k := readkey;
     If (k = '1') and (t[1] = '1') then
      begin
       t[1] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '2') and (t[2] = '2') then
      begin
       t[2] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '3') and (t[3] = '3') then
      begin
       t[3] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '4') and (t[4] = '4') then
      begin
       t[4] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '5') and (t[5] = '5') then
      begin
       t[5] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '6') and (t[6] = '6') then
      begin
       t[6] := play[i].sym;
       jogadas := jogadas + 1;
       jogou := true;
      end;
     If (k = '7') and (t[7] = '7') then
       begin
        t[7] := play[i].sym;
        jogadas := jogadas + 1;
        jogou := true;
       end;
     If (k = '8') and (t[8] = '8') then
       begin
        t[8] := play[i].sym;
        jogadas := jogadas + 1;
        jogou := true;
       end;
     If (k = '9') and (t[9] = '9') then
       begin
        t[9] := play[i].sym;
        jogadas := jogadas + 1;
        jogou := true;
       end;
    Until jogou =  true;
   End;


     (*Teste de jogo*)
     If (t[1] = 'x') and (t[2] = 'x') and (t[3] ='x') then play[i].stat := true;
     If (t[1] = 'o') and (t[2] = 'o') and (t[3] ='o') then play[i].stat := true;
     If (t[4] = 'x') and (t[5] = 'x') and (t[6] ='x') then play[i].stat := true;
     If (t[4] = 'o') and (t[5] = 'o') and (t[6] ='o') then play[i].stat := true;
     If (t[7] = 'x') and (t[8] = 'x') and (t[9] ='x') then play[i].stat := true;
     If (t[7] = 'o') and (t[8] = 'o') and (t[9] ='o') then play[i].stat := true;
     If (t[1] = 'x') and (t[4] = 'x') and (t[7] ='x') then play[i].stat := true;
     If (t[1] = 'o') and (t[4] = 'o') and (t[7] ='o') then play[i].stat := true;
     If (t[2] = 'x') and (t[5] = 'x') and (t[8] ='x') then play[i].stat := true;
     If (t[2] = 'o') and (t[5] = 'o') and (t[8] ='o') then play[i].stat := true;
     If (t[3] = 'x') and (t[6] = 'x') and (t[9] ='x') then play[i].stat := true;
     If (t[3] = 'o') and (t[6] = 'o') and (t[9] ='o') then play[i].stat := true;
     If (t[1] = 'x') and (t[5] = 'x') and (t[9] ='x') then play[i].stat := true;
     If (t[1] = 'o') and (t[5] = 'o') and (t[9] ='o') then play[i].stat := true;
     If (t[3] = 'x') and (t[5] = 'x') and (t[7] ='x') then play[i].stat := true;
     If (t[3] = 'o') and (t[5] = 'o') and (t[7] ='o') then play[i].stat := true;
     (*vis jogo*)
     textcolor (14); textbackground (1);
     gotoxy (33,10); Writeln  ('ษอออหอออหอออป');
     gotoxy (33,11); Writeln  ('บ ',T[1],' บ ',T[2],' บ ',T[3],' บ');
     gotoxy (33,12); Writeln  ('ฬอออฮอออฮอออน');
     gotoxy (33,13); Writeln  ('บ ',T[4],' บ ',T[5],' บ ',T[6],' บ');
     gotoxy (33,14); Writeln  ('ฬอออฮอออฮอออน');
     gotoxy (33,15); Writeln  ('บ ',T[7],' บ ',T[8],' บ ',T[9],' บ');
     gotoxy (33,16); Writeln  ('ศอออสอออสอออผ');

     If (jogadas = 9) and (play[1].stat = false) and (play[2].stat = false) then
       begin
         gameemp := true;
       end;
    end;
  Until (play[i].stat = true) or gameemp = true;
end;

Procedure gameresul;
var k : char;
 begin
  If gameemp = false then
    begin
      If play[1].stat = true then
       begin
        gotoxy (32,6); Writeln ('Jogador 1 Ganhou');
       end else
       begin
        gotoxy (32,6); Writeln ('Jogador 2 Ganhou');
       end;
    end else
    begin
       gotoxy (33,6); Writeln ('Jogo Empatado');
    end;
    k := readkey;
 end;


 (*Programa principal*)
Begin
 Repeat
  Janelatit;  (*interface graf.*)
  Janelamenu;      (*...*)
  imageesq;        (*...*)
  imagedrt;   (*interface graf.*)
  intermenu;
   Case op of
    1: begin
        textbackground (0);
        clrscr;
        imageesq;
        imagedrt;
        gameplay;
        gameresul;
       end;
   end;
 Until op = 2;
End.
