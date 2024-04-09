create or replace database ProjectPortfolio;
use database PROJECTPORTFOLIO;
create warehouse Projects_WH;
create schema Covid_Data;
use schema Covid_Data;

select *
from PROJECTPORTFOLIO.COVID_DATA.COVIDDEATHS
order by 3,4;
select *
from PROJECTPORTFOLIO.COVID_DATA.COVIDVACCINATIONS
order by 3,4;
select location, date, total_cases, new_cases, total_deaths, population
from PROJECTPORTFOLIO.COVID_DATA.COVIDDEATHS
order by 1,2;

---total cases vs total deaths
select location, date, total_cases, total_deaths, (TOTAL_DEATHS/total_cases)*100 as DeathPerc
from PROJECTPORTFOLIO.COVID_DATA.COVIDDEATHS
order by 1,2;
--looking at total cases vs population
select location, date, total_cases, total_deaths, population, (TOTAL_caseS/population)*100 as PercInfected
from PROJECTPORTFOLIO.COVID_DATA.COVIDDEATHS
where location like '%Africa%'
order by 1,2;

--looking at country with highest infection compared to population
select location,population, max(total_cases) as Highest_infection, max((TOTAL_CASES/population))*100 as PercInfected
from PROJECTPORTFOLIO.COVID_DATA.COVIDDEATHS
group by 1,2
order by 4 desc;
