const selectCurrency = (baseCurrency, rates) => ({
  type: 'SWITCH CURRENCY',
  baseCurrency,
  rates
});

export default selectCurrency;
