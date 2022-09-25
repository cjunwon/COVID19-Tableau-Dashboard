show global variables like 'local_infile';
set global local_infile=true;

-- Queries for Tableau Project

SELECT SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent <> ''
ORDER BY 1, 2;
-- INTO OUTFILE '/Users/junwonchoi/Desktop/Programming/Practice/Data Analyst Porrtfolio Project/SQL Data Exploration/DeathPercentage.csv'
-- FIELDS ENCLOSED BY '"'
-- TERMINATED BY ';'
-- ESCAPED BY '"'
-- LINES TERMINATED BY '\r\n';

SELECT location, SUM(new_deaths) as TotalDeathCount
FROM coviddeaths
WHERE continent = ''
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC;

SELECT location, population, MAX(total_cases) as HighestInfectionCount, (MAX(total_cases)/population)*100 AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;

SELECT location, population, date, MAX(total_cases) as HighestInfectionCount, (MAX(total_cases)/population)*100 AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population, date
ORDER BY PercentPopulationInfected DESC;