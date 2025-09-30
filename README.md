# Práctica II: Sistema de Gestión de Venta de Vehículos en Prolog

Este repositorio contiene la **Práctica II** de la asignatura *Lenguajes de Programación y Paradigmas de Computación* (Universidad EAFIT). El objetivo es implementar, en **Prolog**, un sistema para consultar y analizar el inventario de un concesionario de vehículos, generando reportes con `findall/3` y `bagof/3`, y aplicando restricciones de presupuesto.

---

## Integrantes

- Thomas Serna Saldarriaga  
- David Alzate Monroy

---

## Objetivos de la práctica

1. Implementar un sistema en Prolog para gestionar un catálogo de vehículos y filtrar por atributos clave.  
2. Generar reportes estructurados usando predicados como `findall/3` o `bagof/3`.  
3. Aplicar restricciones que garanticen consistencia de resultados (p. ej., no exceder un presupuesto máximo del inventario).

---

## Requisitos y herramientas

- **Intérprete Prolog**: recomendado **SWI‑Prolog (8.x o superior)**.  
- **Editor**: Visual Studio Code (extensión “SWI-Prolog”) o el de preferencia.  
- **Ejecución colaborativa (usados en este proyecto)**: **JDoodle** y **SWISH — SWI‑Prolog for SHaring**.

---

## Descripción

Cada vehículo se modela con el predicado de **5 argumentos**:

```prolog
% vehicle(Marca, Referencia, Tipo, Precio, Año).
vehicle(toyota, corolla, sedan, 22000, 2021).
```

**Tipos válidos**: `sedan`, `suv`, `pickup`, `sport`.  
**Atributos clave**: `Marca`, `Referencia`, `Tipo`, `Precio`, `Año`.

---

## Casos de prueba

1. **Toyota SUV < 30 000**  
   ```prolog
   ?- findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), L).
   % Esperado: L con las referencias Toyota tipo SUV bajo ese precio.
   ```

2. **Ford agrupado por tipo y año (bagof/3)**  
   ```prolog
   ?- bagof((Type, Year, Ref), vehicle(ford, Ref, Type, _, Year), L).
   % Esperado: L agrupando tuplas (Tipo, Año, Ref) de Ford.
   ```

3. **Total de sedanes sin exceder 500 000**  
   ```prolog
   ?- findall(P, vehicle(_, _, sedan, P, _), L),
      sum_list(L, Total),
      Total =< 500000.
   % Esperado: verificación booleana y/o Total calculado.
   ```

---

## Enlaces del proyecto (completar)

- **Video demostrativo (YouTube)**: https://youtu.be/uWxeUPy6pq8 
