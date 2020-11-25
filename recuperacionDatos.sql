use mercancia
select * from ciudad_destino
select * from destino
select * from guia
select * from origen
select * from paquete

alter table ciudad_destino alter column dest_ciudad varchar (50)
alter table destino alter column dest_nom varchar (50)

alter table destino alter column dest_dir varchar (50)
alter table destino alter column dest_tel varchar (50)

insert into ciudad_destino (dest_cod_ciudad, dest_ciudad) values (1, 'medellin')
insert into ciudad_destino (dest_cod_ciudad, dest_ciudad) values (2, 'bogotá')
insert into ciudad_destino (dest_cod_ciudad, dest_ciudad) values (3, 'cali')
insert into ciudad_destino (dest_cod_ciudad, dest_ciudad) values (4, 'montevideo')

insert into destino (dest_id, dest_nom, dest_dir, dest_tel, dest_km, dest_cod_ciudad1) values (1, 'bodega 1','carrera 30 55 55', '310212121', 200.5,2)
insert into destino (dest_id, dest_nom, dest_dir, dest_tel, dest_km, dest_cod_ciudad1) values (2, 'bodega 2','carrera 30 80 34', '310351242', 80.7,1)
insert into destino (dest_id, dest_nom, dest_dir, dest_tel, dest_km, dest_cod_ciudad1) values (3, 'bodega 3','carrera 14 20 17', '310121212', 175.5,2)

insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (100, '2020-07-19', '06:00:00', 500000, 1, 2, 1)
insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (101, '2020-08-14', '17:30:00', 2000000, 1, 1, 2)
insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (102, '2020-08-19', '06:00:00', 500000, 1, 2, 1)
insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (103, '2020-07-19', '06:00:00', 500000, 1, 2, 1)
insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (104, '2020-07-21', '12:35:00', 500000, 1, 2, 1)
insert into guia (guia_no, guia_fecha,guia_hora, valor_flete, dest_id1, orgn_rif1, cod_paq1)
values (105, '2020-07-22', '3:45:00', 500000, 2, 2, 1)

--consulta en ciudaddes destino que comiencen con la letra m

select * from ciudad_destino where dest_ciudad like 'm%'

--consulta en ciudaddes destino que finalice con la letra n
select * from ciudad_destino where dest_ciudad like '%n'

--Donde muestre un nombre particular 
select * from ciudad_destino where dest_ciudad like 'medellin'

--mostrar en forma ascendente
select * from guia order by guia_no asc

--mostrar en forma descendente
select * from guia order by guia_no desc

--empleo de clausula count (contar y agrupar)
select * from guia 
select dest_id1, count(dest_id1) as contador_destino from guia
group by dest_id1

--having para hacer el filtro
select guia_no, count(guia_no) as contador_guias from guia
group by guia_no having count(*) = 1

--sumamos el valor de los fletes en las guías
select * from guia
select sum (valor_flete) as suma from guia

---Antes del Between
select guia_no, valor_flete, cod_paq1 from guia where guia_no >= 100  and guia_no <= 104 order by valor_flete desc

--Con el Operador between
select guia_no, valor_flete, cod_paq1 from guia where guia_no between 101  and  105 order by valor_flete asc

--Con operador in para resumir instrucción para mostrar una información en particular

select * from paquete where (nombre_paq in('mercado libre'))

--para no mostrar un registro
select * from guia where (valor_flete not in(2000000))

--mostrar un número de regístros
select  top 3 * from guia

--- distinct para eliminar repeticiones

select distinct valor_flete from guia

---sacar un promedio

select avg  (valor_flete)as promedio_flete from guia 

--sacar el valor máximo
select max (valor_flete) as maximo from guia

--sacar el valor mínimo
select min (valor_flete)as minimo from guia






