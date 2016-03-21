'use strict'

require! {
  '../src/index.ls': capacitance
  'chai': {expect}
}

describe "capacitance.js Testing Specifications" ->

  capacitors = [1 to 3]

  series    = capacitance capacitors, \series
  parallel  = capacitance capacitors, \parallel
  error     = capacitance capacitors, \error

  specify 'Series: Equivalent capacitance is equal to the inverse of the sum of all the inverted capacitors which make up the association' ->
    expect series .to.equal 0.5454545454545455

  specify 'Seri es: Equivalent capacitance is lower than the lowest capacitor in the association' ->
    expect series .to.be.below capacitors.0

  specify 'Parallel: Equivalent capacitance is equal to the sum of all capacitors which make up the association' ->
    expect parallel .to.equal 6

  specify 'Parallel: Equivalent capacitance is greater than the greatest capacitor in the association' ->
    expect parallel .to.be.above capacitors.2

  specify 'Error: It should return a valid error message when user enters a non-valid capacitor type parameter' ->
    expect error .to.be.a \string

  specify 'Error: It should return the correct error message when user enters a non-valid capacitor type parameter' ->
    expect error .to.equal 'Please enter a valid type of capacitors association.'
