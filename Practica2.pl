vehiculo(toyota, corolla, sedan, 22000, 2021).
vehiculo(toyota, rav4, suv, 22000, 2022).
vehiculo(toyota, highlander, suv, 21000, 2023).
vehiculo(toyota, prado, suv, 60000, 2023).
vehiculo(ford, mustang, sport, 45000, 2023).
vehiculo(ford, ranger, pickup, 35000, 2022).
vehiculo(bmw, x5, suv, 60000, 2021).
vehiculo(bmw, serie3, sedan, 40000, 2020).
vehiculo(chevrolet, camaro, sport, 48000, 2023).
vehiculo(mazda, cx5, suv, 30000, 2023).
vehiculo(honda, civic, sedan, 25000, 2022).
vehiculo(nissan, frontier, pickup, 33000, 2021).
vehiculo(bmw, m3, sport, 70000, 2023).
vehiculo(bmw, m5, sport, 90000, 2022).


% Filtro por presupuesto
vehiculos_por_presupuesto(Ref, PresupuestoMax) :-
    vehiculo(_, Ref, _, Precio, _),
    Precio =< PresupuestoMax.

% Filtrar por marca
vehiculos_por_marca(Marca, Lista):-
    findall(Ref, vehiculo(Marca, Ref, _, _, _), Lista).
    
% Filtrar por marca, tipo y precio
vehiculos_por_mtp(Marca, Tipo, Precio, Lista) :-
    findall(Ref, (vehiculo(Marca, Ref, Tipo, P, _), P < Precio), Lista).

% Filtrar por marca, agrupandolo por tipo y año
vehiculos_por_marca_agr(Marca, Lista) :-
    bagof(Ref, vehiculo(Marca, Ref, _Type, _, _Year), Lista).

% Generación de reportes
generar_reporte(Marca, Tipo, Presupuesto_por_carro, Total_inventario, reporte(Lista, PrecioTotal)) :-
    findall((Referencia, Precio, Ano), (vehiculo(Marca, Referencia, Tipo, Precio, Ano), Precio =< Presupuesto_por_carro), Lista),
    suma_precios(Lista, 0, PrecioTotal),
    PrecioTotal =< Total_inventario.

% suma_precios(Lista, Total).
suma_precios([], Acumulado, Acumulado).
suma_precios([(_, Precio, _)|Cola], Acumulado, Total) :-
    NuevoAcum is Acumulado + Precio,
    suma_precios(Cola, NuevoAcum, Total).