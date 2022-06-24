/// <reference types="cypress" />

// Welcome to Cypress!
//
// This spec file contains a variety of sample tests
// for a todo list app that are designed to demonstrate
// the power of writing tests in Cypress.
//
// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3007/axbitTab/')
  })

  it('includes a working button', () => {

    cy.on('window:alert', (str) => {
      expect(str).to.equal("It worked!")
    });

    cy.get("button").contains("sample").click();
  })
})
