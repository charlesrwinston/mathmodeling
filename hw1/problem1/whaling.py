# Homework 1 Problem 1
# Charles Winston
# 27 January 2018

import matplotlib.pyplot as plt
import numpy as np
import scipy.misc
import sys

######### SET UP ###########

# Instrinsic growth rate
# r = 0.05

# Maximum sustainable population
# K = 300000

# Current population
# x = 100 # temp value

# Annual growth rate without harvesting: G
# If 0 < x < K:         G is positive
# If x > K:             G is negative
# If x = 0 or x = K:    G is 0
# G = r * x * (1 - x/float(K))
def annualGrowthNoHarvesting(x, r=0.05, K=300000):
    G = r * x * (1 - x/float(K))
    return G

# Number of boat days allowed per year
# E = 100 # temp value

# Harvest rate
# H = 0.00001 * E * x
def harvestRate(x, E):
    H = 0.00001 * E * x
    return H

# Annual growth rate with harvesting
# annualGrowth = G - H
def annualGrowthOverall(x, E, r=0.05, K=300000):
    G = annualGrowthNoHarvesting(x, r=r, K=K)
    H = harvestRate(x, E)
    annualGrowth = G - H
    return annualGrowth, G, H

# For fixed E, x (population) reaches a steady state when annualGrowth is 0

def populationSize(x, E, r=0.05, K=300000):
    annualGrowth = annualGrowthOverall(x, E, r=r, K=K)
    population = x + annualGrowth
    return population


# Questions
#   What is steady state harvest rate?

def steadystateRecursive(x, E, r, K, year):
    #print('Year: {}'.format(year))
    #print('Current Population: {}'.format(x))
    #print('Boat Days: {}'.format(E))
    #print('R: {}'.format(r))

    # Find annual growth and check value
    annualGrowth, G, H = annualGrowthOverall(x, E, r=r, K=K)
    if int(round(annualGrowth)) == 0:
        return int(round(x + annualGrowth)), G, H
    else:
        return steadystateRecursive(x + annualGrowth, E, r, K, year + 1)

def steadyStateHarvetRate(E, r=0.05, K=300000):
    return 0.00001 * E * K * (1 - 0.00001 * E / r)

def steadyStatePopulation(E, r=0.05, K=300000):
    return K * (1 - 0.00001 * E / r)

def steadyStateProfit(E, r=0.05, K=300000):
    return 17000 * E - 3.6 * E * E


######### PROBLEM A ##########

def plotSteadyStateHarvestRate(x=70000):
    # List of E values to plot
    Evalues = range(4000)

    # List of steady state harvest rates to plot
    Hvalues = [steadyStateHarvetRate(E) for E in Evalues]

    # Plot steady state harvest rate as a function of E
    plt.plot(Evalues, Hvalues)
    plt.ylabel('Steady State Harvest Rate')
    plt.xlabel('Boat Days allowed per year')
    plt.title('Steady State Harvest Rate based on Number of Boat Days per Year')
    plt.show()

def plotSteadyStatePopulation(x=70000):
    # List of E values to plot
    Evalues = range(4000)

    # List of steady state harvest rates to plot
    populationValues = [steadyStatePopulation(E) for E in Evalues]

    # Plot steady state harvest rate as a function of E
    plt.plot(Evalues, populationValues)
    plt.ylabel('Steady State Population')
    plt.xlabel('Boat Days allowed per year')
    plt.title('Steady State Population based on Number of Boat Days per Year')
    plt.show()

def maximizeSteadyStateHarvestRate(x=70000, r=0.05, K=300000):
    # List of E values to plot
    Evalues = range(3000)

    # List of steady state harvest rates to plot
    steadyStateHarvestRateValues = []
    maxHarvestRate = 0
    correspondingBoatDays = 0
    correspondingPopulation = 0
    for E in Evalues:
        population, G, H = steadyState(x, E, r=r, K=K)
        if H > maxHarvestRate:
            maxHarvestRate = H
            correspondingBoatDays = E
            correspondingPopulation = population

    return maxHarvestRate, correspondingBoatDays, correspondingPopulation


def problemA():
    plotSteadyStateHarvestRate()
    plotSteadyStatePopulation()
    #maxHarvestRate, boatDays, population = maximizeSteadyStateHarvestRate()
    #print('Maximum Steady State Harvest Rate: {}'.format(maxHarvestRate))
    #print('Corresponding number of boat days: {}'.format(boatDays))
    #print('Corresponding population: {}'.format(population))


####### PROBLEM B ##########
def optimalBoatDays(r):
    maxHarvestRate, boatDays, population = maximizeSteadyStateHarvestRate(r=r, K=300000)
    return boatDays

def sensitivity(nFunc, m):
    n = nFunc(m)
    print('Boat Days: {}'.format(n))
    derivative = scipy.misc.derivative(nFunc, m)
    print('derivative: {}'.format(derivative))
    return derivative * (m / float(n))

def sensitivityBoatDaysToR(r=0.05):
    # Compute sensitivity
    return sensitivity(optimalBoatDays, r)

def problemB():
    print(sensitivityBoatDaysToR())


####### PROBLEM C ########
def plotSteadyStateProfit():
    # List of E values to plot
    Evalues = range(4000)

    # List of steady state harvest rates to plot
    Pvalues = [steadyStateProfit(E) for E in Evalues]

    # Plot steady state harvest rate as a function of E
    plt.plot(Evalues, Pvalues)
    plt.ylabel('Steady State Annual Profit')
    plt.xlabel('Boat Days allowed per year')
    plt.title('Steady State Annual Profit for Boat Days per Year')
    plt.show()



if __name__ == '__main__':
    argument = sys.argv[1]
    if argument == 'a':
        problemA()
    elif argument == 'b':
        problemB()
    elif argument == 'c':
        plotSteadyStateProfit()
    #elif argument == 'd':
