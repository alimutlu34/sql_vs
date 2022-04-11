<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/mutlu/OneDrive/Masaüstü/sql/SQLiteDatabaseBrowserPortable/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:maingenres"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="genres" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="80"/><column index="2" value="144"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">SELECT *
FROM invoices
--WHERE BillingCountry != &quot;USA&quot;
WHERE NOT BillingCountry = &quot;USA&quot;
ORDER By total DESC ;


SELECT *
FROM invoices
--WHERE BillingCountry != &quot;USA&quot;
WHERE  BillingCountry = &quot;USA&quot; or BillingCountry = &quot;Germany&quot;
ORDER By InvoiceId ASC ;


SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN  &quot;2012-01-01&quot; and &quot;2013-01-02 00:00:00&quot; ;

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN &quot;2009-01-01&quot; AND &quot;2011-12-31&quot;
ORDER By InvoiceDate DESC
LIMIT 1;

SELECT FirstName, LastName, country
FROM customers
WHERE country in (&quot;Belgium&quot;, &quot;Norway&quot;,&quot;Canada&quot;,&quot;USA&quot;);



</sql><sql name="SQL 3">-- WRITE A QUERY THAT RETURNS TRACK NAME AND ITS COMPOSER FROM
-- TRACKS TABLE

SELECT name,Composer
FROM tracks ; 

-- WRITE A QUERY THAT RETURNS ALL COLUMNS FROM TRACKS TABLE
SELECT *
FROM tracks;

-- WRITE A QUERY THAT RETURNS THE NAME OF COMPOSERS OF EACH track
SELECT DISTINCT Composer
FROM tracks;

-- WRITE A QUERY THAT RETURNS UNIQUE ALBUMID, MEDIATYPEID FROM
-- TRACKS TABLE
SELECT DISTINCT AlbumId,MediaTypeId
FROM tracks ;

-- WRITE A QUERY THAT RETURNS TRACK NAME AND TRACKID OF ‘Jorge Ben'
SELECT name,TrackId
FROM tracks
WHERE Composer= &quot;Jorge Ben&quot; ;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH
-- TOTAL AMOUNT IS GREATER THAN $25
SELECT *
FROM invoices
WHERE total &gt; 25 ;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH
-- TOTAL AMOUNT IS LESS THAN $15. JUST RETURN 5 ROWS


SELECT *
FROM invoices
WHERE total &lt; 15
LIMIT 5 ;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH
-- TOTAL AMOUNT IS GREATER THAN $10. THEN SORT THE TOTAL AMOUNTS
-- IN DESCENDING ORDER, LASTLY DISPLAY TOP 2 ROWS

SELECT * 
FROM invoices 
WHERE total &gt; 10
ORDER BY total DESC 
LIMIT 1 OFFSET 1;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH
-- BILLING COUNTRY IS NOT CANADA. THEN SORT THE TOTAL AMOUNTS IN
-- ASCENDING ORDER, LASTLY DISPLAY TOP 10 ROWS

SELECT *
from invoices
WHERE NOT BillingCountry = &quot;Canada&quot;
ORDER by  total ASC
LIMIT 10 ;

-- WRITE A QUERY THAT RETURNS INVOICEID, CUSTOMERID AND TOTAL
-- DOLLAR AMOUNT FOR EACH INVOICE. THEN SORT THEM FIRST BY
-- CUSTOMERID IN ASCENDING, THEN TOTAL DOLLAR AMOUNT IN
-- DESCENDING ORDER.

SELECT InvoiceId,CustomerId,total
FROM invoices
ORDER by CustomerId ASC, total DESC ;

-- WRITE A QUERY THAT RETURNS ALL TRACK NAMES THAT START WITH ‘B’
-- END WITH ‘S’

SELECT name
FROM tracks
WHERE name like &quot;B%S&quot; ;
--WHERE name like &quot;B%&quot; and name like &quot;%S&quot;;

-- WRITE A QUERY THAT RETURNS THE NEWEST DATE AMONG THE INVOICE
-- DATES BETWEEN 2008 AND 2011

SELECT InvoiceDate
FROM invoices
WHERE InvoiceDate BETWEEN &quot;2008-01-01&quot; AND &quot;2012-01-01&quot;
ORDER by InvoiceDate DESC
LIMIT 1;

-- WRITE A QUERY THAT RETURNS THE FIRST AND LAST NAME OF
-- THE CUSTOMERS WHO HAVE ORDERS FROM NORWAY AND BELGIUM

SELECT FirstName, LastName
FROM customers
WHERE Country IN ('Belgium', 'Norway');

--WRITE A QUERY THAT RETURNS THE TRACK NAMES OF ‘ZAPPA'

SELECT Composer,name
FROM tracks
WHERE Composer like &quot;%Zappa&quot; ;

--HOW MANY TRACKS AND INVOICES ARE THERE IN THE DIGITAL MUSIC
--STORE, DISPLAY SEPERATELY

SELECT count (*)
FROM tracks ;

SELECT count (*)
FROM invoices ;


--HOW MANY COMPOSERS ARE THERE IN THE DIGITAL MUSIC STORE

SELECT COUNT(DISTINCT Composer)
FROM tracks;

--HOW MANY TRACKS DOES EACH ALBUM HAVE, DISPLAY ALBUMID AND
--NUMBER OF TRACKS SORTED FROM HIGHEST TO LOWEST

SELECT AlbumId,
COUNT(*) AS number_of_tracks
FROM tracks
GROUP BY AlbumId
ORDER BY number_of_tracks DESC;

--WRITE A QUERY THAT RETURNS TRACK NAME HAVING THE MINIMUM AND
--MAXIMUM DURATION, DISPLAY SEPERATELY

SELECT Name, MIN(Milliseconds)
FROM tracks;

SELECT Name, MAX(Milliseconds)
FROM tracks;


--WRITE A QUERY THAT RETURNS THE TRACKS HAVING DURATION LESS
--THAN THE AVERAGE DURATION

SELECT *
FROM tracks
WHERE Milliseconds &lt; 393599.212103911;
-----------------------------------------------------------------------
SELECT *
FROM tracks
WHERE Milliseconds &lt; (SELECT AVG(Milliseconds)
FROM tracks);

--WRITE A QUERY THAT RETURNS THE TOTAL NUMBER OF EACH
--COMPOSER’s TRACK.

SELECT Composer, COUNT(*)
FROM tracks
GROUP BY Composer;
----------------------------------------------------------------------
SELECT Composer, COUNT(Composer)
FROM tracks
GROUP BY Composer;
---------------------------------------------------------------------
SELECT Composer, COUNT(Composer)
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

--WRITE A QUERY THAT RETURNS THE GENRE OF EACH TRACK.

SELECT tracks.Name, genres.Name
FROM tracks
JOIN genres
ON tracks.GenreId = genres.GenreId;
------------------------------------------------------------
SELECT t.Name, g.Name
FROM tracks t
JOIN genres g
ON t.GenreId = g.GenreId;


--WRITE A QUERY THAT RETURNS THE ARTIST’s ALBUM INFO.

SELECT *
FROM artists
LEFT JOIN albums
ON albums.ArtistId = artists.ArtistId ;

--WRITE A QUERY THAT RETURNS THE MINIMUM DURATION OF THE TRACK
--IN EACH ALBUM. DISPLAY ALBUMID, ALBUM TITLE AND DURATION OF THE
--TRACK. THEN SORT THEM FROM HIGHEST TO LOWEST

SELECT tracks.AlbumId, albums.Title,
MIN(tracks.Milliseconds) AS min_duration
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId, albums.Title
ORDER BY min_duration DESC;

-- WRITE A QUERY THAT RETURNS ALBUMS WHOSE TOTAL DURATION IS
--HIGHER THAN 60 MIN. DISPLAY ALBUM TITLE AND THEIR DURATIONS. THEN
--SORT THE RESULT FROM HIGHEST TO LOWEST

SELECT albums.Title, SUM(tracks.Milliseconds) AS total_duration
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING total_duration &gt; 3600000
ORDER BY total_duration DESC;

--WRITE A QUERY THAT RETURNS TRACKID, TRACK NAME AND ALBUMID
--INFO OF THE ALBUM WHOSE TITLE ARE ‘Prenda Minha’, 'Heart of the Night'
--AND 'Out Of Exile'.

SELECT Trackid, Name, Albumid
FROM tracks
WHERE albumid IN (
		SELECT AlbumId
		FROM albums
		WHERE Title IN ('Prenda Minha', 'Heart of the Night', 'Out Of Exile'));

</sql><current_tab id="1"/></tab_sql></sqlb_project>
