--NEW DATASET
SELECT * FROM tutorial.crunchbase_companies;
SELECT * FROM tutorial.crunchbase_acquisitions;
SELECT * FROM tutorial.crunchbase_investments;
SELECT * FROM tutorial.crunchbase_investments_part1;
SELECT * FROM tutorial.crunchbase_investments_part2;

SELECT * FROM tutorial.crunchbase_companies;
SELECT * FROM tutorial.crunchbase_acquisitions;
--MAPPING: permalink = company_permalink

select 
  comp.permalink,
  comp.name,
  acq.acquirer_name,
  acq.acquired_at
from tutorial.crunchbase_companies as comp
left join tutorial.crunchbase_acquisitions as acq
  on comp.permalink = acq.company_permalink
;

--RIGHT JOIN
select 
  comp.permalink,
  comp.name,
  acq.acquirer_name,
  acq.acquired_at
from tutorial.crunchbase_companies as comp
right join tutorial.crunchbase_acquisitions as acq
  on comp.permalink = acq.company_permalink
;

select 
  comp.permalink,
  comp.name,
  acq.acquirer_name,
  acq.acquired_at
from tutorial.crunchbase_companies as comp
join tutorial.crunchbase_acquisitions as acq
  on comp.permalink = acq.company_permalink
;

--FULL OUTER JOIN
select 
  comp.permalink,
  comp.name,
  acq.acquirer_name,
  acq.acquired_at
from tutorial.crunchbase_companies as comp
full outer join tutorial.crunchbase_acquisitions as acq
  on comp.permalink = acq.company_permalink
;

--SELF JOIN
--GOAL: IDENTIFY COMPANIES THAT RECEIVE AN INVESTMENT FROM GREAT BRITAIN (GBR) FOLLOWING AN INVESTMENT FROM JAPAN (JPN)
--NEW DATASET
SELECT * FROM tutorial.crunchbase_investments_part1 as jpn_invest;
SELECT * FROM tutorial.crunchbase_investments_part1 as gbr_invest;

SELECT
  DISTINCT jpn_invest.company_name,
  jpn_invest.company_permalink
FROM tutorial.crunchbase_investments_part1 as jpn_invest
JOIN tutorial.crunchbase_investments_part1 as gbr_invest
  ON jpn_invest.company_name = gbr_invest.company_name  --mapping//common column
  and gbr_invest.investor_country_code = 'GBR'          --
  AND gbr_invest.funded_at > jpn_invest.funded_at     
where jpn_invest.investor_country_code = 'JPN'
order by 1;

--check
--Aperto Networks
select * from tutorial.crunchbase_investments_part1
where company_name = 'Aperto Networks'
and investor_country_code in ('JPN', 'GBR')
order by funded_at;


--JOINING WITH COMPARISON OPERATOR
--FUNDED_YEAR > FOUNDED_YEAR + 5
SELECT
  cc.permalink,
  cc.name,
  cc.status,
  count(inv1.investor_permalink) as investor_cnt
FROM tutorial.crunchbase_companies as cc
LEFT JOIN tutorial.crunchbase_investments_part1 as inv1
  on cc.permalink = inv1.company_permalink --mapping/common column between cc and inv1
  and inv1.funded_year > cc.founded_year + 5 --JOINING WITH COMPARISON OPERATOR
group by 1,2,3;

--JOINING ON MULTIPLE KEYS
--permalink = company_permalink
--name = company_name
select 
  cc.name,
  cc.permalink,
  inv1.investor_permalink,
  inv1.investor_name,
  inv1.funded_year
from tutorial.crunchbase_companies as cc
LEFT JOIN tutorial.crunchbase_investments_part1 as inv1
on cc.permalink = inv1.company_permalink --mapping1
and cc.name = inv1.company_name --mapping2
;

SELECT 
  comp.state_code,
  COUNT (DISTINCT comp.permalink) as unique_companies,
  COUNT (DISTINCT acq.company_permalink) as unique_acquired_companies 
FROM tutorial.crunchbase_companies as comp
JOIN tutorial.crunchbase_acquisitions as acq
  ON comp.permalink = acq.company_permalink
WHERE comp.state_code IS NOT NULL
GROUP BY comp.state_code
ORDER BY unique_acquired_companies DESC;


--ASSIGNMENT | SQL 3 | Week 9
--Use tutorial.crunchbase_companies and tutorial.crunchbase_investments Tables
SELECT * FROM tutorial.crunchbase_companies;
SELECT * FROM tutorial.crunchbase_investments;
SELECT * FROM tutorial.crunchbase_investments_part1;

--Shows a company’s name, “status” (found in the Companies table), and the number of unique investors in that company. Order by the number of investors from the most to fewest. Limit to only companies in the state of New York.
--1. FINAL ANSWER
SELECT 
  cbcomp.name as company_name,
  cbcomp.status,
  COUNT (DISTINCT cbinvest.investor_name) as unique_investors
FROM tutorial.crunchbase_companies as cbcomp
LEFT JOIN tutorial.crunchbase_investments as cbinvest
  ON cbcomp.permalink = cbinvest.company_permalink 
WHERE cbcomp.state_code = 'NY'
GROUP BY 1, 2
ORDER BY unique_investors DESC;

--Shows 3 columns. The first indicates which dataset (part 1 or 2) the data comes from, the second shows company status, and the third is a count of the number of investors.
--2. FINAL ANSWER
-- Part 1 investments
SELECT 
  'part1' AS dataset,
  c.status,
  COUNT(DISTINCT i.investor_name) AS investor_count
FROM tutorial.crunchbase_investments_part1 AS i
LEFT JOIN tutorial.crunchbase_companies AS c
  ON i.company_permalink = c.permalink
GROUP BY 1,2;

UNION ALL

-- Part 2 investments
SELECT 
  'part2' AS dataset,
  c.status,
  COUNT(DISTINCT i.investor_name) AS investor_count
FROM tutorial.crunchbase_investments_part2 AS i
LEFT JOIN tutorial.crunchbase_companies AS c
  ON i.company_permalink = c.permalink
GROUP BY 1,2;


SELECT 
  comp.state_code,
  COUNT (DISTINCT comp.name) as unique_companies,
  COUNT (DISTINCT acq.company_permalink) as unique_acquired_companies 
FROM tutorial.crunchbase_companies as comp
JOIN tutorial.crunchbase_acquisitions as acq
  ON comp.permalink = acq.company_permalink
WHERE comp.state_code IS NOT NULL
GROUP BY comp.state_code
ORDER BY unique_acquired_companies DESC;

