#1

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", c.title AS "TITLE", d.pub_name AS "PUBLISHER"
FROM authors a, titleauthor b, titles c, publishers d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id;

#2

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COUNT(a.au_id) AS "TITLE COUNT", d.pub_name AS "PUBLISHER" 
FROM authors a, titleauthor b, titles c, publishers d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_id;


#3

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(c.qty) as "TOTAL"
FROM authors a, titleauthor b, sales c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY total DESC
LIMIT 3;


#4

select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", ifnull(sum(d.qty),0) AS "TOTAL"
FROM authors a LEFT JOIN titleauthor b
ON a.au_id = b.au_id 
LEFT JOIN titles c
ON b.title_id = c.title_id
LEFT JOIN sales d
ON b.title_id = d.title_id
GROUP BY a.au_id
ORDER BY sum(d.qty) DESC;



