const m = require('zigbee-herdsman-converters/lib/modernExtend');
const reporting = require('zigbee-herdsman-converters/lib/reporting');


const repInterval = {
  MAX: 62000,
  HOUR: 3600,
  MINUTES_30: 1800,
  MINUTES_15: 900,
  MINUTES_10: 600,
  MINUTES_5: 300,
  MINUTE: 60,
};


const configureReportingPayload = (attribute, min, max, change, overrides) => {
  const payload = {
    attribute: attribute,
    minimumReportInterval: min,
    maximumReportInterval: max,
    reportableChange: change,
  };


  if (overrides) {
    if (overrides.hasOwnProperty('min')) payload.minimumReportInterval = overrides.min;
    if (overrides.hasOwnProperty('max')) payload.maximumReportInterval = overrides.max;
    if (overrides.hasOwnProperty('change')) payload.reportableChange = overrides.change;
  }

  return [payload];
};

const configureReporting = {
  temperature: async (endpoint, overrides) => {
    const payload = configureReportingPayload('measuredValue', 10, repInterval.HOUR, 100, overrides);
    await endpoint.configureReporting('msTemperatureMeasurement', payload);
  },
};

const definition = {
  zigbeeModel: ['XIAO_SWT_01'],
  model: 'XIAO_SWT_01',
  vendor: 'KaSaJa',
  description: 'Automatically generated definition',
  extend: [m.deviceEndpoints({ "endpoints": { "1": 1, "2": 2 } }), m.temperature(), m.commandsOnOff({ "endpointNames": ["1", "2"] }), m.commandsLevelCtrl({ "endpointNames": ["1", "2"] })],
  meta: { "multiEndpoint": true },
  configure: async (device, coordinatorEndpoint, logger) => {
    const endpoint = device.getEndpoint(1);
    await reporting.bind(endpoint, coordinatorEndpoint, ['msTemperatureMeasurement']);
    await configureReporting.temperature(endpoint);
  },
};

module.exports = definition;