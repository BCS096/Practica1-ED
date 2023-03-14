with dcola;
with ada.Text_IO;
use ada.Text_IO;
with ada.Integer_Text_IO;
use ada.Integer_Text_IO;
procedure Main is
   package mcola is new dcola(item => Character); -- cambiar aqui si quieres poner Integer
   use mcola;
   cua:cola;
   caracter:Character; --aqui también Integer
begin
   Put_Line("INTRODUEIX UNA SECUENCIA DE CARACTERS ACABADA AMB '.' DELS CARACTERS QUE VOLS FICAR DINS LA CUA : ");
   get(caracter);
   while caracter/='.' loop --para integer por ejemplo se puede poner while caracter/=0 loop
      poner(cua,caracter);--y asi se mete numero , enter y se mete otro número hasta finalizar con un 0.
      get(caracter);
   end loop;
   if not esta_vacia(cua) then
      --bucle per imprimir tots els elements de la cua
      Put_Line("");
      Put_Line("CONTINGUT DE LA CUA :");
      while not esta_vacia(cua) loop
         Put(coger_primero(cua));
         borrar_primero(cua);
      end loop;
   else
      Put_Line("NO S'HA INTRODUIT RES PER TECLAT");
   end if;
   Put_Line("");
end Main;
