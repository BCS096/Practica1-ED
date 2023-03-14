package body dcola is
   
   --proceso para vaciar la cola
   procedure cvacia (qu: out cola) is
      spila:pila renames qu.p;
   begin
      pvacia(spila); --para vaciar la cola vaciamos la pila de consulta
   end cvacia;
   
   --proceso para añadir un elemento en la cola
   procedure poner (qu: in out cola; x: in item) is
      pilaAux: pila renames qu.q;
      pilaConsulta: pila renames qu.p;
   begin 
      while not estavacia(pilaConsulta) loop --mientras la pila en la que se guardan los datos 
         empila(pilaAux,cima(pilaConsulta)); --(pila de consulta)no esté vacía se copian los datos 
         desempila(pilaConsulta);            --en la otra pila
      end loop;
      empila(pilaAux,x); -- añadimos el elemento nuevo en pila auxiliar
      while not estavacia(pilaAux) loop      --mientras la pila auxiliar no esté vacía se vuelcan
         empila(pilaConsulta,cima(pilaAux)); --dato a dato en la pila en la que se guardan los datos de
         desempila(pilaAux);                 --la cola (pila de consulta)
      end loop;
      exception
         when storage_error => raise espacio_desbordado;
   end poner;
   
   --proceso para borrar el primer elemento de la cola
   procedure borrar_primero(qu: in out cola) is
      spila:pila renames qu.p;
   begin
      desempila(spila); --desempilamos en la pila de consulta
   exception
      when constraint_error => raise mal_uso;
   end borrar_primero;
   
   --proceso que devuelve el primer elemento de la cola
   function coger_primero (qu: in cola) return item is
      spila:pila renames qu.p;
   begin
      return cima(spila); --miramos el primer elemento de la pila de consulta que también será
   exception              --el primer elemento de la cola
      when constraint_error => raise mal_uso;
   end coger_primero;
   
   --proceso que verifica si la cola está vacía
   function esta_vacia(qu: in cola) return boolean is
      spila:pila renames qu.p;
   begin
      return estavacia(spila); --si la pila de consulta está vacía , la cola también
   end esta_vacia;
   
end dcola;
