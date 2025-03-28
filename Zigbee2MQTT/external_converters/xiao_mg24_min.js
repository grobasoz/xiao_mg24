const m = require('zigbee-herdsman-converters/lib/modernExtend');

const definition = {
  zigbeeModel: ['XIAO_MG24_MIN'],
  model: 'XIAO_MG24_MIN',
  vendor: 'KaSaJa',
  description: 'Minimum Application for XIAO MG24',
  extend: [m.light()]};

module.exports = definition;