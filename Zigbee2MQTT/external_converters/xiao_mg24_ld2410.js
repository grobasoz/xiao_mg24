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
  occupancy: async (endpoint, overrides) => {
    const payload = configureReportingPayload('occupancy', 10, repInterval.HOUR, 100, overrides);
    await endpoint.configureReporting('msOccupancySensing', payload);
  },
};

const definition = {
  zigbeeModel: ['XIAO_LD2410_01'],
  model: 'XIAO_LD2410_01',
  vendor: 'KaSaJa',
  description: 'XOAI MG24 LD2410 Occupancy Sensor',
  extend: [m.occupancy()],
  meta: {},
  configure: async (device, coordinatorEndpoint, logger) => {
    const endpoint = device.getEndpoint(1);
    await reporting.bind(endpoint, coordinatorEndpoint, ['msOccupancySensing']);
    await configureReporting.occupancy(endpoint);
  },
};

module.exports = definition;