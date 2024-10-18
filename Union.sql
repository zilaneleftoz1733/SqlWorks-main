-- Union : iki farkli sorguyu tek bir sonuc olarak birlestirmeye yarar
-- sorgudaki kolon sayilari ayni olmak zorundadir. Gelen kayitlar tekil dir. 
-- HEpsini gormek istersek union all ifadesini kullanamk gerekir.

SELECT p.product_id , p.product_name 
from products p 
UNION 
SELECT p1.product_id , p1.product_name 
from yedekurunler p1 
