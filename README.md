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
   ?- vehiculos_por_mtp(toyota, suv, 30000, Caso1).
   % Esperado: Caso1 con los vehículos Toyota tipo SUV cuyo precio sea < 30000.
   ```

2. **Ford agrupado por tipo y año (bagof/3)**  
   ```prolog
   ?- bagof(Ref, vehiculo(ford, Ref, Type, _, Year), Caso3).
   % Esperado: Para cada combinación (Type, Year), Caso3 unifica con las referencias Ford de ese grupo.
   ```

3. **Reporte de sedanes con topes 100 000–500 000**  
   ```prolog
   ?- generar_reporte(_, sedan, 100000, 500000, Caso3).
   % Esperado: Caso3 unifica con el reporte (lista/total) cumpliendo los topes dados.
   ```

---

## Enlaces del proyecto

- **Video demostrativo (YouTube)**: [Link de youtube](https://youtu.be/uWxeUPy6pq8)
- **Ejemplos de ejecución (Google drive)**: [Link de google drive](https://drive.google.com/drive/folders/16SgNNSQ93xeoHa8Jtkw4Q0rmVbxp01dH?usp=drive_link)

