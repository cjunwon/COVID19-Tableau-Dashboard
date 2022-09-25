show global variables like 'local_infile';
set global local_infile=true;

USE PracticeProject1;
SHOW TABLES;

CREATE TABLE coviddeaths (
	iso_code VARCHAR(10),
    continent VARCHAR(20),
    location VARCHAR(20),
    date DATE,
    population INT,
    total_cases INT,
    new_cases INT,
    new_cases_smoothed DOUBLE(20,5),
    total_deaths INT,
    new_deaths INT,
    new_deaths_smoothed DOUBLE(20,5),
    total_cases_per_million DOUBLE(20,5),
    new_cases_per_million DOUBLE(20,5),
    new_cases_smoothed_per_million DOUBLE(20,5),
    total_deaths_per_million DOUBLE(20,5),
    new_deaths_per_million DOUBLE(20,5),
    new_deaths_smoothed_per_million DOUBLE(20,5),
    reproduction_rate DOUBLE(20,5),
    icu_patients INT,
    icu_patients_per_million DOUBLE(20,5),
    hosp_patients INT,
    hosp_patients_per_million DOUBLE(20,5),
    weekly_icu_admissions INT,
    weekly_icu_admissions_per_million DOUBLE(20,5),
    weekly_hosp_admissions INT,
    weekly_hosp_admissions_per_million DOUBLE(20,5)
);


LOAD DATA LOCAL INFILE '/Users/junwonchoi/Desktop/Programming/Practice/Data Analyst Porrtfolio Project/SQL Data Exploration/CovidDeaths.csv'
INTO TABLE coviddeaths
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE covidvaccinations (
	iso_code VARCHAR(10),
    continent VARCHAR(20),
    location VARCHAR(20),
    date DATE,
    total_tests INT,
    new_tests INT,
    total_tests_per_thousand DOUBLE(20,5),
    new_tests_per_thousand DOUBLE(20,5),
    new_tests_smoothed INT,
    new_tests_smoothed_per_thousand DOUBLE(20,5),
    positive_rate DOUBLE(20,5),
    tests_per_case DOUBLE(20,5),
    tests_units VARCHAR(20),
    total_vaccinations INT,
    people_vaccinated INT,
    people_fully_vaccinated INT,
    total_boosters INT,
    new_vaccinations INT,
    new_vaccinations_smoothed INT,
    total_vaccinations_per_hundred DOUBLE(20,5),
    people_vaccinated_per_hundred DOUBLE(20,5),
    people_fully_vaccinated_per_hundred DOUBLE(20,5),
    total_boosters_per_hundred DOUBLE(20,5),
    new_vaccinations_smoothed_per_million INT,
    new_people_vaccinated_smoothed INT,
    new_people_vaccinated_smoothed_per_hundred DOUBLE(20,5),
    stringency_index DOUBLE(20,5),
    population_density DOUBLE(20,5),
    median_age DOUBLE(20,5),
    aged_65_older DOUBLE(20,5),
    aged_70_older DOUBLE(20,5),
    gdp_per_capita DOUBLE(20,5),
    extreme_poverty DOUBLE(20,5),
    cardiovasc_death_rate DOUBLE(20,5),
    diabetes_prevalence DOUBLE(20,5),
    female_smokers DOUBLE(20,5),
    male_smokers DOUBLE(20,5),
    handwashing_facilities DOUBLE(20,5),
    hospital_beds_per_thousand DOUBLE(20,5),
    life_expectancy DOUBLE(20,5),
    human_development_index DOUBLE(20,5),
    excess_mortality_cumulative_absolute DOUBLE(20,5),
    excess_mortality_cumulative DOUBLE(20,5),
    excess_mortality DOUBLE(20,5),
    excess_mortality_cumulative_per_million DOUBLE(20,5)
);

LOAD DATA LOCAL INFILE '/Users/junwonchoi/Desktop/Programming/Practice/Data Analyst Porrtfolio Project/SQL Data Exploration/CovidVaccinations.csv'
INTO TABLE covidvaccinations
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- SELECT *
-- FROM coviddeaths;

-- SELECT *
-- FROM covidvaccinations;

