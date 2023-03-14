with dpila;
generic
   --parametros
   type item is private;
package dcola is
   type cola is limited private;
   mal_uso: exception;
   espacio_desbordado: exception;
   --procesos
   procedure cvacia (qu: out cola);
   procedure poner (qu: in out cola; x: in item);
   procedure borrar_primero(qu: in out cola);
   function coger_primero (qu: in cola) return item;
   function esta_vacia(qu: in cola) return boolean;
private  
   --instancia del paquete de la implementaci�n de la pila
   package mpila is new dpila(elem => item);
   use mpila;
   type cola is record
      p:pila;--p ser� la pila de consulta
      q:pila;--q ser� la pila auxiliar
   end record;
end dcola;

