--- Ejercicio 1:Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.

SELECT flight_id, route_no, status
FROM bookings.flights
WHERE status = 'On Time'

--- Ejercicio 2: Escribe una consulta que extraiga todas las columnas de la tabla bookings 
--- y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

SELECT * FROM bookings
WHERE total_amount > 1000000

--- Ejercicio 3: Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). 
--- Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT * FROM airplanes_data

--- Ejercicio 4:Con el resultado anterior visualizado previamente,
--- escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737.
--- (Código Modelo Avión = 733)

SELECT flight_id 
FROM flights 
WHERE route_no IN (
	SELECT route_no 
	FROM routes 
	WHERE airplane_code='733'
	)

--- Ejercicio 5: Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas 
--- que se llaman Irina.

SELECT * FROM tickets
WHERE passenger_name ILIKE 'Irina%'

--- Ejercicio 6: Mostrar las ciudades con más de un aeropuerto.

SELECT city, COUNT(*)
FROM airports
GROUP BY city 
HAVING COUNT (*) > 1

--- Ejercicio 7: Mostrar el número de vuelos por modelo de avión.

SELECT r.airplane_code, COUNT(*) AS num_vuelos
FROM flights f
JOIN routes r ON f.route_no = r.route_no
GROUP BY r.airplane_code

--- Ejercicio 8: Reservas con más de un billete (varios pasajeros).

SELECT book_ref , COUNT (*)
FROM tickets
GROUP BY book_ref
HAVING COUNT (*) > 1

--- Ejercicio 9: Vuelos con retraso de salida superior a una hora.

SELECT 
flight_id, route_no, scheduled_departure, actual_departure
FROM
flights
WHERE (actual_departure - scheduled_departure )> INTERVAL '1 hour'
