const m = require('zigbee-herdsman-converters/lib/modernExtend');

const definition = {
  zigbeeModel: ['XIAO_MG24_LIT'],
  model: 'XIAO_MG24_LIT',
  vendor: 'KaSaJa',
  description: 'XIAO MG24 Light',
  extend: [m.deviceEndpoints({"endpoints":{"1":1,"2":2}}), m.light(), m.light()],
  meta: { "multiEndpoint": true },
};

module.exports = definition;