'use strict';
const { sanitizeEntity } = require('strapi-utils');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
    async findEmail(ctx) {
        const { user } = ctx.params;
        console.log(ctx.params);
        const entity = await strapi.services.accessuser.findOne({ user });
        return sanitizeEntity(entity, { model: strapi.models.accessuser });
    },
};
