const m = require('zigbee-herdsman-converters/lib/modernExtend');

const definition = {
    zigbeeModel: ['ZigbeeSwitch'],
    model: 'ZigbeeSwitch',
    vendor: 'Espressif',
    description: 'Automatically generated definition',
    extend: [m.commandsOnOff()],
    meta: {},
};

module.exports = definition;