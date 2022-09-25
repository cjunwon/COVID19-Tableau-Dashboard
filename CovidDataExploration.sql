USE PracticeProject1;
SHOW TABLES;

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM coviddeaths
WHERE continent <> ''
ORDER BY location, date;

-- Showing Total Cases vs. Total Deaths
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE location LIKE '%south korea%'
ORDER BY location, date;

-- Showing Total Cases vs. Population
SELECT location, date, population, total_cases, (total_cases/population)*100 AS PercentInfected
FROM coviddeaths
WHERE location LIKE '%south korea%'
ORDER BY location, date;

-- Showing Countries with Highest Infection Rate per Population
SELECT location, population, MAX(total_cases) as HighestInfectionCount, (MAX(total_cases)/population)*100 AS PercentInfected
FROM coviddeaths
GROUP BY location, population
ORDER BY PercentInfected DESC;

-- Showing Countries wtih Highest Death Count
SELECT location, MAX(total_deaths) as TotalDeathCount
FROM coviddeaths
WHERE continent <> ''
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Showing Continents with Highest Death Count
SELECT location, MAX(total_deaths) as TotalDeathCount
FROM coviddeaths
WHERE continent = ''
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Showing Global numbers
SELECT date, SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent <> ''
GROUP BY date
ORDER BY 1, 2;

-- Total Cases and Deaths Global (All Time)
SELECT SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent <> ''
ORDER BY 1, 2;


-- Showing Total Population vs. Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations , SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> ''
ORDER BY 2,3;

-- Using CTE
WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
AS (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations , SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> ''
)
SELECT *, (RollingPeopleVaccinated/Population)*100 AS RollingPercentVaccinated
FROM PopvsVac;

-- Using Temp Table
DROP TABLE IF EXISTS PercentPopulationVaccinted;
CREATE TABLE PercentPopulationVaccinted (
	continent VARCHAR(20),
    location VARCHAR(30),
    date DATE,
    population INT,
    new_vaccinations INT,
    RollingPeopleVaccinated NUMERIC
);

INSERT INTO PercentPopulationVaccinted
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations , SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> '';

SELECT *, (RollingPeopleVaccinated/population)*100 AS VaccinatedPopulationPercent
FROM PercentPopulationVaccinted;

-- Creating View for Visualizations
CREATE VIEW PctPopVac AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations , SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent <> '';

SELECT *
FROM PctPopVac;
